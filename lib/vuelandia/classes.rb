module Vuelandia

#############################COMMON######################################
    module IdName
	    attr_accessor :ID, :Name
    end

    class IDName
	    include IdName
    end
##########################################################################

################################TO PARSE ALL DESTINATIONS LIST############
    class Country 
	    include IdName
	    attr_accessor :Destinations
    end

    class Destination 
	    include IdName
	    attr_accessor :Zones
    end
###########################################################################


##################TO RETURN THE DATA WHEN AVAILABILITY RETURNS MULTIPLE RESULTS############
    class MultipleDataParsed
	    attr_accessor :Type, :Name, :Destination, :Country, :AdditionalsParameters
    end

    class AdditionalsParameters
	    attr_accessor :Destination, :DestinationID, :IDE
    end
###########################################################################################


##################TO RETURN THE DATA WHEN AVAILABILITY RETURNS A UNIQUE RESULT#############
    class UniqueDataParsed
	    attr_accessor :obj, :TotalDestinationHotels, :AvailablesHotel, :SessionID, :Hotels
    end

    class Hotel
	    #######Optional#######
	    attr_accessor :Category, :City, :Latitud, :Longitud, :Photo, :ImportantNote
	    #######Required#######
	    attr_accessor :HotelDetails, :Rooms
    end

    class HotelDetails 
	    include IdName
	    attr_accessor :NameOriginal
    end

    class Photo
	    attr_accessor :Width, :Height, :URL
    end

    class Room
	    attr_accessor :RoomType, :Boards
    end

    class RoomType 
	    include IdName
	    attr_accessor :Amenities, :NumberRooms
    end

    class Board
	    attr_accessor :IDItem, :Board_type, :Currency, :Price, :PriceAgency, :DirectPayment, :DATOS,
				      :StrokePrice, :Offer, :Refundable
    end
###########################################################################################

##############################TO PARSE ADDITIONAL INFORMATION##############################
    class AdditionalInformationParsed
	    attr_accessor :HotelDetails, :SearchAvailabilityDetails, :AgencyBalance, :AdditionalInformation,
				      :PVP, :PriceAgency, :Rates	
    end

    class HotelDetails 
	    include IdName
	    attr_accessor :Category, :Address, :City, :Location, :Photo
    end

    class Location
	    attr_accessor :Country, :Destination, :Zone
    end

    class SearchAvailabilityDetails
	    attr_accessor :Check_in_date, :Check_in_day_of_week, :Check_out_date, :Check_out_day_of_week,
				      :Days, :RoomID, :Occupancies, :RoomNames, :BoardID, :BoardName  
    end

    class Occupancy
	    attr_accessor :Rooms, :Adults, :Children, :Ages
    end

    class RoomName
	    attr_accessor :numberOfRooms, :RoomID, :Name
    end

    class AgencyBalance
	    attr_accessor :Balance, :Credit, :AmountAvailable
    end

    class AdditionalInformation
	    attr_accessor :status, :CommentsAllow, :onRequest, :Rooms, :CancellationPeriod, :Supplements, 
				      :Discounts, :Offers, :EssentialInformation, :fechaInicioCancelacion, :horaInicioCancelacion,
				      :fechaLimiteSinGastos, :horaLimiteSinGastos, :PaymentTypes 
    end

    class RoomAdditional
	    attr_accessor :RoomID, :From, :To, :numberOfRooms, :Adults, :Children, :BoardID, :Price, :PriceAgency
    end

    class CancellationPeriod
	    attr_accessor :From, :To, :Hour, :Amount, :PriceAgency
    end

    class SupplementOrDiscount
	    attr_accessor :id, :paymenttype, :From, :To, :Obligatory, :Type, :Description, :Paxes_number, :Price, :PriceAgency
    end

    class Offer
	    attr_accessor :Name, :Description
    end

    class Information
	    attr_accessor :From, :To, :Description
    end

    class PaymentType
	    attr_accessor :code, :Name
    end

    class Rate
	    attr_accessor :DATOS, :IDHotel, :Price, :PriceAgency, :RefundableCode, :AdditionalInformation
    end
###########################################################################################

##############TO PERFORM AND PARSE A BOOKING CONFIRMATION##################################
    class Client
	    attr_accessor :name, :surnames, :documentNumber, :country, :region, :EMail, :PostCode, :Phone
    end

    class Company
	    attr_accessor :nameCompany, :cifCompany, :addressCompany, :postalCodeCompany,
				      :ProvinceCompany, :regionCompany
    end

    class BookingConfirmationParsed
	    attr_accessor :ReservationStatus, :PaymentStatus, :ConfirmationStatus, :BookingID,
				      :SecurityCode, :ERROR, :Errors
    end 

    class Error
	    attr_accessor :type, :message
    end
###########################################################################################

##############TO PARSE HOTEL AVAILABILITY DETAILS##########################################
    class HotelAvailabilityDetailsParsed
	    attr_accessor :SessionID, :SearchAvailabilityParameters, :Hotel, :SessionHotels
    end

    class SearchAvailabilityParameters
	    attr_accessor :Check_in_date, :Check_out_date, :Location, :Occupancies
    end

    class DetailedHotel
	    attr_accessor :HotelDetails, :obj, :Accomodations
    end

    class DetailedHotelDetails 
	    include IdName
	    attr_accessor :Category, :Address, :City, :Location, :Latitud, :Longitud, :Description,
				      :Photo, :Notes, :Photos, :ServicesFacilities, :CharacteristicsFacilities, 
				      :ImportantNote 
    end

    class Note
	    attr_accessor :Type, :Text
    end

    class Service
	    include IdName
	    attr_accessor :Type, :Value, :AdditionalCharges 
    end

    class Characteristic < Service 
	    attr_accessor :ID, :TypeID
    end

    class DetailedRoom
	    attr_accessor :RoomType, :Boards
    end
###########################################################################################

########################TO PARSE THE VOUCHER###############################################
    class VoucherParsed
	    attr_accessor :id, :BookingStatus, :BookingModificationStatus, :Locator, :AgencyReference,
				      :CreationDate, :CheckInDate, :CheckOutDate, :Price, :NetPrice, :CancellationFeeDate,
				      :CancellationDate, :CancellationTime, :CancellationPrice, :CustomerName, :Hotel,
				      :City, :Zone, :Destination, :Country, :Comments, :Payment, :Rooms, :Supplements,
				      :Offers, :CancellationPolicies, :HotelAddress, :HotelZipCode, :HotelTelephoneNumber,
				      :HotelMap, :HotelCategory, :ServiceProvider, :RetailAgency, :VoucherLogo, 
				      :SecondVoucherLogo, :VoucherStamp, :PayableBy, :OtherFields
    end

    class Comment
	    attr_accessor :type, :fromdate, :todate, :Text
    end

    class VoucherRoom
	    attr_accessor :roomsnumber, :CheckInDate, :CheckOutDate, :Adults, :Children, :ChildAges,
				      :Babies, :RoomType, :Amenities, :CompleRoomName, :BoardType, :Price, :Offer
    end

    class CancellationPolicy < SupplementOrDiscount
	    attr_accessor :Time
    end 

    class ServiceProvider
	    include IdName
	    attr_accessor :FiscalIdentificationCode, :City, :Country, :Address, :ZipCode, :Email,
				      :TelephoneNumbers, :FaxNumbers, :Logo
    end

    class TelephoneOrFaxNumber
	    attr_accessor :CountryCode, :Number
    end

    class RetailAgency
	    include IdName
	    attr_accessor :CustomerServiceTelephoneNumber, :CustomerServiceHours, :Logo, :VoucherStamp 
    end

    class PayableBy
	    attr_accessor :Name, :FiscalIdentificationCode
    end

    class OtherField
	    attr_accessor :Name, :Value
    end
###########################################################################################


##################TO PARSE THE BOOKING CANCELLATION########################################
    class BookingCancellationParsed
	    attr_accessor :BookingStatus, :HotelName, :BookingPrice, :CheckInDate, :CheckOutDate,
				      :Rooms, :FechaAnulacionSinGastos, :CancellationPolicies, :CurrentCancellationPrice,
				      :CancellationPrice, :ERROR, :Errors 
    end
###########################################################################################

######################TO PARSE BOOKING LIST################################################
    class BookingListParsed
	    attr_accessor :id, :BookingStatus, :BookingModificationStatus, :Locator, :AgencyReference,
				      :CreationDate, :CheckInDate, :CheckOutDate, :Price, :NetPrice, :Commission,
				      :TaxOfCommission, :CancellationFeeDate, :CancellationDate, :CancellationTime,
				      :CancellationPrice, :CustomerName, :Hotel, :City, :Zone, :Destination, :Country
    end
###########################################################################################

########################TO PARSE HOTEL LIST################################################
    class HotelListParsed
	    attr_accessor :HotelDetails, :Photos, :ServicesFacilities, :CharacteristicsFacilities
    end

    class HotelListDetails
	    include IdName
	    attr_accessor :Continent, :Country, :Destination, :Zone, :Province, :Categoy, :Description,
				      :Address, :ZipCode, :City, :Phone, :Fax, :EMail, :URLWeb, :Situation, 
				      :Latitud, :Longitud
    end

    class HotelListPhoto
	    attr_accessor :Type, :URLPhoto
    end
###########################################################################################

end
