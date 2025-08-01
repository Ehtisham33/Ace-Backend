
from django.db import models


class AgeGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    label = models.CharField(max_length=255)
    min_age = models.IntegerField(blank=True, null=True)
    max_age = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'age_groups'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class AuthtokenToken(models.Model):
    key = models.CharField(primary_key=True, max_length=40)
    created = models.DateTimeField()
    user = models.OneToOneField(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'authtoken_token'


class AvailabilityDayCourts(models.Model):
    id = models.BigAutoField(primary_key=True)
    availability_day_id = models.BigIntegerField()
    court_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'availability_day_courts'


class AvailabilityDayDurations(models.Model):
    id = models.BigAutoField(primary_key=True)
    availability_day_id = models.BigIntegerField()
    duration = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'availability_day_durations'


class AvailabilityDayIntervals(models.Model):
    id = models.BigAutoField(primary_key=True)
    availability_day_id = models.BigIntegerField()
    interval_number = models.IntegerField()
    start_time = models.TimeField()
    end_time = models.TimeField()
    discount_percent = models.DecimalField(max_digits=5, decimal_places=2)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'availability_day_intervals'


class AvailabilityDays(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_availability_id = models.BigIntegerField()
    day = models.CharField(max_length=9)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'availability_days'


class Cache(models.Model):
    key = models.CharField(primary_key=True, max_length=255)
    value = models.TextField()
    expiration = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cache'


class CacheLocks(models.Model):
    key = models.CharField(primary_key=True, max_length=255)
    owner = models.CharField(max_length=255)
    expiration = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cache_locks'


class CategoryGroup(models.Model):
    group_category_id = models.BigIntegerField(primary_key=True)  # The composite primary key (group_category_id, group_id) found, that is not supported. The first column is selected.
    group_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'category_group'
        unique_together = (('group_category_id', 'group_id'),)


class ClubBannerImages(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    banner_img = models.CharField(max_length=255)
    banner_img_cropped = models.CharField(max_length=255, blank=True, null=True)
    is_primary = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_banner_images'


class ClubBranches(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    name = models.CharField(max_length=128)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_branches'


class ClubCheckInSettings(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    type = models.CharField(max_length=10)
    open_ms_before = models.IntegerField()
    close_ms_after = models.IntegerField()
    default_active = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_check_in_settings'


class ClubCourtConfigurations(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    type = models.CharField(max_length=15)
    count = models.IntegerField()
    status = models.CharField(max_length=8)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_court_configurations'


class ClubCurrency(models.Model):
    club_id = models.BigIntegerField(primary_key=True)  # The composite primary key (club_id, currency_id) found, that is not supported. The first column is selected.
    currency_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'club_currency'
        unique_together = (('club_id', 'currency_id'),)


class ClubLatestActivities(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    activity_type = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    performed_by = models.BigIntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_latest_activities'


class ClubLevelSystems(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    sport_id = models.BigIntegerField()
    level_id = models.BigIntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_level_systems'


class ClubOpeningHours(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    day = models.CharField(max_length=9)
    is_closed = models.IntegerField()
    opening_time = models.TimeField(blank=True, null=True)
    closing_time = models.TimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_opening_hours'


class ClubSportCourts(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_sport_id = models.BigIntegerField()
    type = models.CharField(max_length=15)
    count = models.IntegerField()
    status = models.CharField(max_length=8)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_sport_courts'


class ClubSports(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    sport_id = models.BigIntegerField()
    membership_fee = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_sports'


class Clubs(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=64)
    short_name = models.CharField(max_length=32, blank=True, null=True)
    no_of_branches = models.IntegerField()
    user_id = models.BigIntegerField()
    organisation_name = models.CharField(max_length=64, blank=True, null=True)
    organisation_no = models.CharField(max_length=16, blank=True, null=True)
    license_number = models.CharField(max_length=16, blank=True, null=True)
    is_parent_club = models.IntegerField()
    parent_club_id = models.BigIntegerField(blank=True, null=True)
    logo_url = models.CharField(max_length=255, blank=True, null=True)
    about_the_hall = models.TextField(blank=True, null=True)
    timezone = models.CharField(max_length=64, blank=True, null=True)
    contact_email = models.CharField(max_length=64, blank=True, null=True)
    contact_phone_number = models.CharField(max_length=64, blank=True, null=True)
    whatsapp = models.CharField(max_length=64, blank=True, null=True)
    telephone = models.CharField(max_length=16, blank=True, null=True)
    website = models.CharField(max_length=255, blank=True, null=True)
    linkedin = models.CharField(max_length=255, blank=True, null=True)
    facebook = models.CharField(max_length=255, blank=True, null=True)
    twitter = models.CharField(max_length=255, blank=True, null=True)
    threads = models.CharField(max_length=255, blank=True, null=True)
    instagram = models.CharField(max_length=255, blank=True, null=True)
    is_user_location_same = models.IntegerField()
    location_id = models.CharField(max_length=255, blank=True, null=True)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    postal_code = models.CharField(max_length=10, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    state = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    country_id = models.BigIntegerField(blank=True, null=True)
    timezone_id = models.BigIntegerField(blank=True, null=True)
    cafe_restaurant = models.IntegerField()
    conference_rooms = models.IntegerField()
    dressing_room = models.IntegerField()
    free_parking = models.IntegerField()
    handicapped = models.IntegerField()
    rental = models.IntegerField()
    shop = models.IntegerField()
    accessible_restrooms = models.IntegerField()
    showers = models.IntegerField()
    lockers = models.IntegerField()
    no_of_followers = models.IntegerField()
    allow_child_credits = models.IntegerField()
    allow_membership = models.IntegerField()
    allow_player_matches = models.IntegerField()
    accepts_freelance_coaches = models.IntegerField()
    default_cancellation_time_booking = models.BigIntegerField()
    default_future_booking_days = models.IntegerField()
    status = models.CharField(max_length=26)
    reason = models.TextField(blank=True, null=True)
    is_admin = models.IntegerField()
    waiver_notice = models.CharField(max_length=255, blank=True, null=True)
    require_waiver_acceptance = models.IntegerField()
    profile_submission_deadline_hours = models.IntegerField()
    created_by = models.BigIntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clubs'


class ClubsAdditionalInformation(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    feature_name = models.CharField(max_length=255)
    is_available = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clubs_additional_information'


class Coaches(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.BigIntegerField()
    home_address = models.CharField(max_length=64, blank=True, null=True)
    emergency_contact = models.CharField(max_length=16, blank=True, null=True)
    emergency_contact_person_name = models.CharField(max_length=64, blank=True, null=True)
    emergency_contact_person_relationship = models.CharField(max_length=64, blank=True, null=True)
    banner_image = models.CharField(max_length=255, blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    serving_role = models.CharField(max_length=13)
    training_type = models.CharField(max_length=7)
    job_type = models.CharField(max_length=9)
    club_id = models.BigIntegerField(blank=True, null=True)
    can_instruct = models.IntegerField()
    experience_min = models.IntegerField(blank=True, null=True)
    experience_max = models.IntegerField(blank=True, null=True)
    is_hidden = models.IntegerField()
    can_cancel_sessions = models.IntegerField()
    default_cancel_time = models.IntegerField()
    booking_days_ahead = models.IntegerField()
    min_hours_before_booking = models.IntegerField()
    is_verified = models.IntegerField()
    status = models.CharField(max_length=18)
    ratings = models.DecimalField(max_digits=3, decimal_places=1)
    created_by = models.BigIntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'coaches'


class Countries(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    code = models.CharField(unique=True, max_length=2)
    phone_code = models.CharField(max_length=255, blank=True, null=True)
    currency = models.CharField(max_length=255, blank=True, null=True)
    emoji = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'countries'


class CourtBookingBanners(models.Model):
    id = models.BigAutoField(primary_key=True)
    banner_image = models.CharField(max_length=255, blank=True, null=True)
    booking_id = models.BigIntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_banners'


class CourtBookingCourts(models.Model):
    id = models.BigAutoField(primary_key=True)
    booking_id = models.BigIntegerField()
    court_id = models.BigIntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_courts'


class CourtBookingDescriptions(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField()
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_descriptions'


class CourtBookingTemplates(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    type = models.CharField(max_length=255)
    details = models.TextField()
    user_id = models.BigIntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_templates'


class CourtBookings(models.Model):
    id = models.BigAutoField(primary_key=True)
    title = models.CharField(max_length=255)
    activity_type = models.CharField(max_length=10)
    created_by = models.BigIntegerField()
    cancellation_period = models.IntegerField(blank=True, null=True)
    check_in_opens_before_hours = models.IntegerField()
    check_in_closes_after_hours = models.IntegerField()
    discount_codes_applied = models.TextField(db_collation='utf8mb4_bin', blank=True, null=True)
    booking_date = models.DateField()
    booking_day = models.CharField(max_length=9)
    start_time = models.TimeField()
    end_time = models.TimeField()
    rule = models.TextField(blank=True, null=True)
    repeat_every = models.IntegerField()
    is_recurring = models.IntegerField()
    recurrence_order = models.IntegerField()
    follow_id = models.BigIntegerField(blank=True, null=True)
    customize_recurrent_activity_end_datetime = models.DateTimeField(blank=True, null=True)
    info = models.TextField(blank=True, null=True)
    is_group_booking = models.IntegerField()
    group_id = models.BigIntegerField(blank=True, null=True)
    post_in_group_id = models.BigIntegerField(blank=True, null=True)
    withdrawal_lock_hours = models.BigIntegerField(blank=True, null=True, db_comment='Number of hours before event start when withdrawal is locked')
    category = models.CharField(max_length=17)
    tournament_format = models.CharField(max_length=14)
    type = models.CharField(max_length=7)
    class_level = models.CharField(max_length=12, blank=True, null=True)
    is_multi_court_booking = models.IntegerField()
    is_checked_terms_and_conditions = models.IntegerField()
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
    discount = models.IntegerField(blank=True, null=True)
    price_per_person = models.DecimalField(max_digits=10, decimal_places=2)
    payment_status = models.CharField(max_length=7)
    payment_method = models.CharField(max_length=50, blank=True, null=True)
    require_player_level = models.IntegerField()
    level_off_id = models.BigIntegerField(blank=True, null=True)
    level_to_id = models.BigIntegerField(blank=True, null=True)
    automatic_cancellation = models.IntegerField()
    auto_cancel_if_dhc = models.IntegerField()
    auto_cancel_if_dpnr = models.IntegerField()
    get_feedback = models.IntegerField()
    hide_training_from_app = models.IntegerField()
    participant_limit = models.IntegerField(blank=True, null=True)
    no_of_points = models.IntegerField(blank=True, null=True)
    is_private_tournament = models.IntegerField()
    open = models.IntegerField(blank=True, null=True)
    booking_status = models.CharField(max_length=9)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_bookings'


class CourtSlotDurations(models.Model):
    id = models.BigAutoField(primary_key=True)
    court_id = models.BigIntegerField()
    duration = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_slot_durations'


class Courts(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    sport_id = models.BigIntegerField()
    club_id = models.BigIntegerField()
    surface = models.CharField(max_length=64, blank=True, null=True)
    color = models.CharField(max_length=32, blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=8)
    court_location_type = models.CharField(max_length=7)
    court_type = models.CharField(max_length=6)
    created_by = models.BigIntegerField()
    visibility = models.CharField(max_length=11)
    note = models.TextField(blank=True, null=True)
    buffer_time_between_slots = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'courts'


class Currencies(models.Model):
    id = models.BigAutoField(primary_key=True)
    title = models.CharField(max_length=255)
    code = models.CharField(unique=True, max_length=3)
    symbol_left = models.CharField(max_length=5, blank=True, null=True)
    symbol_right = models.CharField(max_length=5, blank=True, null=True)
    decimal_place = models.IntegerField()
    value = models.DecimalField(max_digits=15, decimal_places=6)
    status = models.IntegerField()
    is_default = models.IntegerField()
    date_modified = models.DateTimeField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'currencies'


class FailedJobs(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = models.CharField(unique=True, max_length=255)
    connection = models.TextField()
    queue = models.TextField()
    payload = models.TextField()
    exception = models.TextField()
    failed_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'failed_jobs'


class GroupCategories(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=255)
    slug = models.CharField(unique=True, max_length=255)
    description = models.TextField(blank=True, null=True)
    is_active = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'group_categories'


class Groups(models.Model):
    id = models.BigAutoField(primary_key=True)
    club_id = models.BigIntegerField(blank=True, null=True)
    sport_id = models.BigIntegerField()
    name = models.CharField(max_length=255)
    information = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    max_members = models.IntegerField(blank=True, null=True)
    age_group_id = models.BigIntegerField(blank=True, null=True)
    gender_restriction = models.CharField(max_length=6)
    timezone = models.CharField(max_length=255, blank=True, null=True)
    visibility = models.CharField(max_length=7)
    hidden_in_feeds = models.IntegerField()
    is_approval_required = models.IntegerField()
    created_by = models.BigIntegerField()
    status = models.CharField(max_length=8)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'groups'


class JobBatches(models.Model):
    id = models.CharField(primary_key=True, max_length=255)
    name = models.CharField(max_length=255)
    total_jobs = models.IntegerField()
    pending_jobs = models.IntegerField()
    failed_jobs = models.IntegerField()
    failed_job_ids = models.TextField()
    options = models.TextField(blank=True, null=True)
    cancelled_at = models.IntegerField(blank=True, null=True)
    created_at = models.IntegerField()
    finished_at = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'job_batches'


class Jobs(models.Model):
    id = models.BigAutoField(primary_key=True)
    queue = models.CharField(max_length=255)
    payload = models.TextField()
    attempts = models.IntegerField()
    reserved_at = models.IntegerField(blank=True, null=True)
    available_at = models.IntegerField()
    created_at = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'jobs'


class Levels(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=255)
    value = models.DecimalField(unique=True, max_digits=10, decimal_places=2)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'levels'


class Migrations(models.Model):
    migration = models.CharField(max_length=255)
    batch = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'migrations'


class ModelHasPermissions(models.Model):
    permission_id = models.BigIntegerField(primary_key=True)  # The composite primary key (permission_id, model_id, model_type) found, that is not supported. The first column is selected.
    model_type = models.CharField(max_length=255)
    model_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'model_has_permissions'
        unique_together = (('permission_id', 'model_id', 'model_type'),)


class ModelHasRoles(models.Model):
    role_id = models.BigIntegerField(primary_key=True)  # The composite primary key (role_id, model_id, model_type) found, that is not supported. The first column is selected.
    model_type = models.CharField(max_length=255)
    model_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'model_has_roles'
        unique_together = (('role_id', 'model_id', 'model_type'),)


class OauthAccessTokens(models.Model):
    id = models.CharField(primary_key=True, max_length=100)
    user_id = models.BigIntegerField(blank=True, null=True)
    client_id = models.CharField(max_length=36)
    name = models.CharField(max_length=255, blank=True, null=True)
    scopes = models.TextField(blank=True, null=True)
    revoked = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    expires_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'oauth_access_tokens'


class OauthAuthCodes(models.Model):
    id = models.CharField(primary_key=True, max_length=100)
    user_id = models.BigIntegerField()
    client_id = models.CharField(max_length=36)
    scopes = models.TextField(blank=True, null=True)
    revoked = models.IntegerField()
    expires_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'oauth_auth_codes'


class OauthClients(models.Model):
    id = models.CharField(primary_key=True, max_length=36)
    user_id = models.BigIntegerField(blank=True, null=True)
    name = models.CharField(max_length=255)
    secret = models.CharField(max_length=100, blank=True, null=True)
    provider = models.CharField(max_length=255, blank=True, null=True)
    redirect = models.TextField()
    personal_access_client = models.IntegerField()
    password_client = models.IntegerField()
    revoked = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'oauth_clients'


class OauthPersonalAccessClients(models.Model):
    id = models.BigAutoField(primary_key=True)
    client_id = models.CharField(max_length=36)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'oauth_personal_access_clients'


class OauthRefreshTokens(models.Model):
    id = models.CharField(primary_key=True, max_length=100)
    access_token_id = models.CharField(max_length=100)
    revoked = models.IntegerField()
    expires_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'oauth_refresh_tokens'


class Permissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    guard_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'permissions'
        unique_together = (('name', 'guard_name'),)


class PlayerSportLevels(models.Model):
    id = models.BigAutoField(primary_key=True)
    player_id = models.BigIntegerField()
    sport_id = models.BigIntegerField()
    rating = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'player_sport_levels'


class Players(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.BigIntegerField()
    age_group_id = models.BigIntegerField(blank=True, null=True)
    status = models.CharField(max_length=8)
    is_premium = models.IntegerField()
    blood_type = models.CharField(max_length=255, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    emergency_contact_name = models.CharField(max_length=255, blank=True, null=True)
    emergency_contact_no = models.CharField(max_length=255, blank=True, null=True)
    relationship = models.CharField(max_length=12, blank=True, null=True)
    facebook = models.CharField(max_length=255, blank=True, null=True)
    twitter = models.CharField(max_length=255, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    gender = models.CharField(max_length=6, blank=True, null=True)
    club_id = models.BigIntegerField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'players'


class QuestionnaireResponses(models.Model):
    id = models.BigAutoField(primary_key=True)
    question_id = models.BigIntegerField()
    answer = models.TextField()
    answer_description = models.TextField(blank=True, null=True)
    rating = models.FloatField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'questionnaire_responses'


class Questionnaires(models.Model):
    id = models.BigAutoField(primary_key=True)
    question = models.TextField()
    question_for_db = models.TextField()
    sport_id = models.BigIntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'questionnaires'


class RoleHasPermissions(models.Model):
    permission_id = models.BigIntegerField(primary_key=True)  # The composite primary key (permission_id, role_id) found, that is not supported. The first column is selected.
    role_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'role_has_permissions'
        unique_together = (('permission_id', 'role_id'),)


class Roles(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    guard_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'roles'
        unique_together = (('name', 'guard_name'),)


class Specialties(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=64)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'specialties'


class Sports(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=255)
    description = models.TextField(blank=True, null=True)
    icon = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sports'


class Timezones(models.Model):
    id = models.BigAutoField(primary_key=True)
    index = models.IntegerField()
    name = models.CharField(max_length=255)
    offset = models.CharField(max_length=255)
    iana = models.CharField(max_length=255)
    country_id = models.BigIntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'timezones'


class UserAvailabilities(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.BigIntegerField()
    type = models.CharField(max_length=8)
    title = models.CharField(max_length=255, blank=True, null=True)
    valid_from = models.DateTimeField(blank=True, null=True)
    valid_until = models.DateTimeField(blank=True, null=True)
    is_default = models.IntegerField()
    is_active = models.IntegerField()
    priority = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user_availabilities'


class UserAvailabilityDayDurationPrices(models.Model):
    availability_day_duration_id = models.BigIntegerField()
    min_players = models.IntegerField()
    max_players = models.IntegerField()
    price = models.DecimalField(max_digits=8, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'user_availability_day_duration_prices'


class UserSpecialties(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.BigIntegerField()
    specialty_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'user_specialties'
        unique_together = (('user_id', 'specialty_id'),)


class UserSports(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_id = models.BigIntegerField()
    sport_id = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'user_sports'
        unique_together = (('user_id', 'sport_id'),)


class Users(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_name = models.CharField(unique=True, max_length=120)
    uuu_id = models.CharField(unique=True, max_length=255)
    email = models.CharField(unique=True, max_length=96)
    first_name = models.CharField(max_length=32, blank=True, null=True)
    last_name = models.CharField(max_length=32, blank=True, null=True)
    phone_number = models.CharField(max_length=50, blank=True, null=True)
    gender = models.CharField(max_length=6)
    date_of_birth = models.DateField(blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    state = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    user_type = models.CharField(max_length=17)
    user_type_id = models.BigIntegerField(blank=True, null=True)
    password = models.CharField(max_length=255)
    old_password = models.CharField(max_length=255, blank=True, null=True)
    code = models.CharField(max_length=40, blank=True, null=True)
    ip = models.CharField(max_length=40, blank=True, null=True)
    provider = models.CharField(max_length=255, blank=True, null=True)
    provider_id = models.CharField(max_length=255, blank=True, null=True)
    otp = models.CharField(max_length=255, blank=True, null=True)
    otp_expires_at = models.DateTimeField(blank=True, null=True)
    otp_used_at = models.DateTimeField(blank=True, null=True)
    otp_attempts = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
