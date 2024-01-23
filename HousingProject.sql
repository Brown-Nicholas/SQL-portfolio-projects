Select *
	from PortfolioProject..HousingData


--First lets look at just the sale date, we want to standarize the date format
select SaleDate, CONVERT(Date,SaleDate) as StandardizeDate
	from PortfolioProject..HousingData

Alter Table HousingData
	add StandardizedDate Date;

Update HousingData
	Set StandardizedDate = CONVERT(Date,SaleDate)

Select StandardizedDate, CONVERT(Date,SaleDate)
	from PortfolioProject..HousingData

--Populating the property address data
select *
	from PortfolioProject..HousingData
	order by ParcelID

--Here we are taking the first step to eliminate all NULL addresses, which occur when we have 2 addresses that are the same on their own uniqueID
--We are making a new column of the address we will be slotting into the NULL
select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
	from PortfolioProject..HousingData a
	JOIN PortfolioProject..HousingData b
		on a.ParcelID = b.ParcelID
		and a.[UniqueID ] <> b.[UniqueID ]
	where a.PropertyAddress is NULL

--Here, we update the actual column, and when running this query and then the above one, should eliminate all addresses
Update a
	set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
	from PortfolioProject..HousingData a
	JOIN PortfolioProject..HousingData b
		on a.ParcelID = b.ParcelID
		and a.[UniqueID ] <> b.[UniqueID ]
	where a.PropertyAddress is NULL

--Next cleaning step is breaking up the address into individual columns (Address, City, State). Will be using a substring and character index
select PropertyAddress
	from PortfolioProject..HousingData

select 
	SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1) as Address,
	SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) + 1, LEN(PropertyAddress)) as City
	from PortfolioProject..HousingData

alter table HousingData
	add PropertySplitAddress Nvarchar(255);

update HousingData
	set PropertySplitAddress = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)

alter table HousingData
	add PropertySplitCity Nvarchar(255);

update HousingData
	set PropertySplitCity = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress) + 1, LEN(PropertyAddress))

select *
	from PortfolioProject..HousingData

--The above was on the property address, now lets clean up the owners address. We will do it different using parsname
select OwnerAddress
	from PortfolioProject..HousingData

select 
	PARSENAME(REPLACE(OwnerAddress,',','.'),3) as Address,
	PARSENAME(REPLACE(OwnerAddress,',','.'),2) as City,
	PARSENAME(REPLACE(OwnerAddress,',','.'),1) as State
	from PortfolioProject..HousingData

alter table HousingData
	add OwnerSplitAddress Nvarchar(255);

update HousingData
	set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3)

alter table HousingData
	add OwnerSplitCity Nvarchar(255);

update HousingData
	set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)

alter table HousingData
	add OwnerSplitState Nvarchar(255);

update HousingData
	set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)
	
select *
	from PortfolioProject..HousingData

--Now we will change all Y and N symbols to 'Yes' and 'No' in the 'Sold as Vacant' column
select Distinct(SoldAsVacant),COUNT(SoldAsVacant)
	from PortfolioProject..HousingData
	group by SoldAsVacant
	order by 2

select SoldAsVacant
	,CASE when SoldAsVacant = 'Y' THEN 'Yes'
		  when SoldAsVacant = 'N' THEN 'No'	
		  else SoldAsVacant
		  end	
	from PortfolioProject..HousingData

update HousingData
	set SoldAsVacant = Case when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant 
	end

--Now we will remove duplicates within the data set. Will write a CTE and use windows functions to find the duplicate values

with RowNumCTE as (
	select *,
			ROW_NUMBER() over (
			partition by ParcelID,
			PropertyAddress,
			SalePrice,
			SaleDate,
			LegalReference
			order by
				UniqueID) row_num
		from PortfolioProject..HousingData
		)


select *
	from RowNumCTE
	where row_num > 1
	order by PropertyAddress

--We will now delete some unused columns
Alter table PortfolioProject..HousingData
	drop column OwnerAddress,TaxDistrict,PropertyAddress,SaleDate

Alter table PortfolioProject..HousingData
	drop column SaleDate



select *
	from PortfolioProject..HousingData

	