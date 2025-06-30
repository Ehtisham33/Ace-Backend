# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AgeGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    label = models.CharField(max_length=255)
    min_age = models.PositiveIntegerField(blank=True, null=True)
    max_age = models.PositiveIntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'age_groups'


class AvailabilityDayCourts(models.Model):
    id = models.BigAutoField(primary_key=True)
    availability_day = models.ForeignKey('AvailabilityDays', models.DO_NOTHING)
    court = models.ForeignKey('Courts', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'availability_day_courts'


class AvailabilityDayDurations(models.Model):
    id = models.BigAutoField(primary_key=True)
    availability_day = models.ForeignKey('AvailabilityDays', models.DO_NOTHING)
    duration = models.PositiveSmallIntegerField()

    class Meta:
        managed = False
        db_table = 'availability_day_durations'


class AvailabilityDayIntervals(models.Model):
    id = models.BigAutoField(primary_key=True)
    availability_day = models.ForeignKey('AvailabilityDays', models.DO_NOTHING)
    interval_number = models.PositiveIntegerField()
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
    user_availability = models.ForeignKey('UserAvailabilities', models.DO_NOTHING)
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
    group_category = models.OneToOneField('GroupCategories', models.DO_NOTHING, primary_key=True)  # The composite primary key (group_category_id, group_id) found, that is not supported. The first column is selected.
    group = models.ForeignKey('Groups', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'category_group'
        unique_together = (('group_category', 'group'),)


class ClubBannerImages(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey('Clubs', models.DO_NOTHING)
    banner_img = models.CharField(max_length=255)
    banner_img_cropped = models.CharField(max_length=255, blank=True, null=True)
    is_primary = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_banner_images'


class ClubCheckInSettings(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey('Clubs', models.DO_NOTHING)
    type = models.CharField(max_length=10)
    open_ms_before = models.IntegerField()
    close_ms_after = models.IntegerField()
    default_active = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_check_in_settings'


class ClubLevelSystems(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey('Clubs', models.DO_NOTHING)
    sport = models.ForeignKey('Sports', models.DO_NOTHING)
    level = models.ForeignKey('Levels', models.DO_NOTHING)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_level_systems'


class ClubOpeningHours(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey('Clubs', models.DO_NOTHING)
    day = models.CharField(max_length=9)
    is_closed = models.IntegerField()
    opening_time = models.TimeField(blank=True, null=True)
    closing_time = models.TimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'club_opening_hours'


class ClubSports(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey('Clubs', models.DO_NOTHING)
    sport = models.ForeignKey('Sports', models.DO_NOTHING)
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
    user = models.ForeignKey('users', models.DO_NOTHING)
    organisation_name = models.CharField(max_length=64, blank=True, null=True)
    organisation_no = models.CharField(max_length=16, blank=True, null=True)
    parent_club = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    is_parent_club = models.IntegerField()
    no_of_branches = models.IntegerField()
    about_the_hall = models.TextField(blank=True, null=True)
    timezone = models.CharField(max_length=64, blank=True, null=True)
    contact_email = models.CharField(max_length=64, blank=True, null=True)
    telephone = models.CharField(max_length=16, blank=True, null=True)
    facebook = models.CharField(max_length=255, blank=True, null=True)
    twitter = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    postal_code = models.CharField(max_length=10, blank=True, null=True)
    website = models.CharField(max_length=255, blank=True, null=True)
    logo_url = models.CharField(max_length=255, blank=True, null=True)
    no_of_followers = models.IntegerField()
    location_id = models.CharField(max_length=255, blank=True, null=True)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    state = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    currency = models.ForeignKey('Currencies', models.DO_NOTHING)
    status = models.CharField(max_length=26)
    reason = models.TextField(blank=True, null=True)
    is_admin = models.IntegerField()
    cafe_restaurant = models.IntegerField()
    conference_rooms = models.IntegerField()
    dressing_room = models.IntegerField()
    free_parking = models.IntegerField()
    handicapped = models.IntegerField()
    rental = models.IntegerField()
    shop = models.IntegerField()
    allow_child_credits = models.IntegerField()
    allow_membership = models.IntegerField()
    allow_player_matches = models.IntegerField()
    accepts_freelance_coaches = models.IntegerField()
    default_cancellation_time_booking = models.BigIntegerField()
    default_future_booking_days = models.IntegerField()
    indoor_courts = models.IntegerField()
    indoor_courts_status = models.IntegerField()
    outdoor_courts = models.IntegerField()
    outdoor_courts_status = models.IntegerField()
    single_courts = models.IntegerField()
    single_courts_status = models.IntegerField()
    double_courts = models.IntegerField()
    double_courts_status = models.IntegerField()
    waiver_notice = models.CharField(max_length=255, blank=True, null=True)
    require_waiver_acceptance = models.IntegerField()
    profile_submission_deadline_hours = models.IntegerField()
    created_by = models.ForeignKey('users', models.DO_NOTHING, db_column='created_by', related_name='clubs_created_by_set', blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clubs'


class ClubsAdditionalInformation(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey(Clubs, models.DO_NOTHING)
    feature_name = models.CharField(max_length=255)
    is_available = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clubs_additional_information'


class CoachActivityContents(models.Model):
    id = models.BigAutoField(primary_key=True)
    coach = models.ForeignKey('users', models.DO_NOTHING)
    type = models.CharField(max_length=5)
    file_url = models.CharField(max_length=255)
    file_extension = models.CharField(max_length=10)
    thumbnail_url = models.CharField(max_length=255, blank=True, null=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    created_by = models.ForeignKey('users', models.DO_NOTHING, db_column='created_by', related_name='coachactivitycontents_created_by_set', blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'coach_activity_contents'


class Coaches(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey('users', models.DO_NOTHING)
    home_address = models.CharField(max_length=64, blank=True, null=True)
    emergency_contact = models.CharField(max_length=16, blank=True, null=True)
    emergency_contact_person_name = models.CharField(max_length=64, blank=True, null=True)
    emergency_contact_person_relationship = models.CharField(max_length=64, blank=True, null=True)
    banner_image = models.CharField(max_length=255, blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    serving_role = models.CharField(max_length=13)
    training_type = models.CharField(max_length=7)
    job_type = models.CharField(max_length=9)
    club = models.ForeignKey(Clubs, models.DO_NOTHING, blank=True, null=True)
    can_instruct = models.IntegerField()
    experience_min = models.PositiveIntegerField(blank=True, null=True)
    experience_max = models.PositiveIntegerField(blank=True, null=True)
    is_hidden = models.IntegerField()
    can_cancel_sessions = models.IntegerField()
    default_cancel_time = models.IntegerField()
    booking_days_ahead = models.IntegerField()
    min_hours_before_booking = models.IntegerField()
    is_verified = models.IntegerField()
    status = models.CharField(max_length=18)
    reason = models.CharField(max_length=255, blank=True, null=True)
    ratings = models.DecimalField(max_digits=3, decimal_places=1)
    created_by = models.ForeignKey('users', models.DO_NOTHING, db_column='created_by', related_name='coaches_created_by_set', blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'coaches'


class CourtBookingBanners(models.Model):
    id = models.BigAutoField(primary_key=True)
    banner_image = models.CharField(max_length=255, blank=True, null=True)
    booking = models.ForeignKey('CourtBookings', models.DO_NOTHING)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_banners'


class CourtBookingCourts(models.Model):
    id = models.BigAutoField(primary_key=True)
    booking = models.ForeignKey('CourtBookings', models.DO_NOTHING)
    court = models.ForeignKey('Courts', models.DO_NOTHING)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_courts'


class CourtBookingDescriptions(models.Model):
    id = models.BigAutoField(primary_key=True)
    club = models.ForeignKey(Clubs, models.DO_NOTHING)
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
    user = models.ForeignKey('users', models.DO_NOTHING)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_booking_templates'


class CourtBookings(models.Model):
    id = models.BigAutoField(primary_key=True)
    title = models.CharField(max_length=255)
    activity_type = models.CharField(max_length=10)
    created_by = models.ForeignKey('users', models.DO_NOTHING, db_column='created_by')
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
    follow = models.ForeignKey('self', models.DO_NOTHING, blank=True, null=True)
    customize_recurrent_activity_end_datetime = models.DateTimeField(blank=True, null=True)
    info = models.TextField(blank=True, null=True)
    is_group_booking = models.IntegerField()
    group_id = models.PositiveBigIntegerField(blank=True, null=True)
    post_in_group = models.ForeignKey('Groups', models.DO_NOTHING, blank=True, null=True)
    withdrawal_lock_hours = models.PositiveBigIntegerField(blank=True, null=True, db_comment='Number of hours before event start when withdrawal is locked')
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
    level_off = models.ForeignKey('Levels', models.DO_NOTHING, blank=True, null=True)
    level_to = models.ForeignKey('Levels', models.DO_NOTHING, related_name='courtbookings_level_to_set', blank=True, null=True)
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
    court = models.ForeignKey('Courts', models.DO_NOTHING)
    duration = models.IntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'court_slot_durations'


class Courts(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=255)
    sport = models.ForeignKey('Sports', models.DO_NOTHING)
    club = models.ForeignKey(Clubs, models.DO_NOTHING)
    surface = models.CharField(max_length=64, blank=True, null=True)
    color = models.CharField(max_length=32, blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=8)
    court_location_type = models.CharField(max_length=7)
    court_type = models.CharField(max_length=6)
    created_by = models.ForeignKey('users', models.DO_NOTHING, db_column='created_by')
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
    club = models.ForeignKey(Clubs, models.DO_NOTHING, blank=True, null=True)
    sport = models.ForeignKey('Sports', models.DO_NOTHING)
    name = models.CharField(max_length=255)
    information = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    max_members = models.PositiveIntegerField(blank=True, null=True)
    age_group = models.ForeignKey(AgeGroups, models.DO_NOTHING, blank=True, null=True)
    gender_restriction = models.CharField(max_length=6)
    timezone = models.CharField(max_length=255, blank=True, null=True)
    visibility = models.CharField(max_length=7)
    hidden_in_feeds = models.IntegerField()
    is_approval_required = models.IntegerField()
    created_by = models.ForeignKey('users', models.DO_NOTHING, db_column='created_by')
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
    attempts = models.PositiveIntegerField()
    reserved_at = models.PositiveIntegerField(blank=True, null=True)
    available_at = models.PositiveIntegerField()
    created_at = models.PositiveIntegerField()

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
    permission = models.OneToOneField('Permissions', models.DO_NOTHING, primary_key=True)  # The composite primary key (permission_id, model_id, model_type) found, that is not supported. The first column is selected.
    model_type = models.CharField(max_length=255)
    model_id = models.PositiveBigIntegerField()

    class Meta:
        managed = False
        db_table = 'model_has_permissions'
        unique_together = (('permission', 'model_id', 'model_type'),)


class ModelHasRoles(models.Model):
    role = models.OneToOneField('Roles', models.DO_NOTHING, primary_key=True)  # The composite primary key (role_id, model_id, model_type) found, that is not supported. The first column is selected.
    model_type = models.CharField(max_length=255)
    model_id = models.PositiveBigIntegerField()

    class Meta:
        managed = False
        db_table = 'model_has_roles'
        unique_together = (('role', 'model_id', 'model_type'),)


class OauthAccessTokens(models.Model):
    id = models.CharField(primary_key=True, max_length=100)
    user_id = models.PositiveBigIntegerField(blank=True, null=True)
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
    user_id = models.PositiveBigIntegerField()
    client_id = models.CharField(max_length=36)
    scopes = models.TextField(blank=True, null=True)
    revoked = models.IntegerField()
    expires_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'oauth_auth_codes'


class OauthClients(models.Model):
    id = models.CharField(primary_key=True, max_length=36)
    user_id = models.PositiveBigIntegerField(blank=True, null=True)
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
    player = models.ForeignKey('Players', models.DO_NOTHING)
    sport = models.ForeignKey('Sports', models.DO_NOTHING)
    rating = models.TextField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'player_sport_levels'


class Players(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey('users', models.DO_NOTHING)
    age_group = models.ForeignKey(AgeGroups, models.DO_NOTHING, blank=True, null=True)
    status = models.CharField(max_length=8)
    is_premium = models.IntegerField()
    blood_type = models.CharField(max_length=255, blank=True, null=True)
    emergency_contact_person_name = models.CharField(max_length=255, blank=True, null=True)
    emergency_contact = models.CharField(max_length=255, blank=True, null=True)
    emergency_contact_person_relationship = models.CharField(max_length=255, blank=True, null=True)
    facebook = models.CharField(max_length=255, blank=True, null=True)
    twitter = models.CharField(max_length=255, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    club = models.ForeignKey(Clubs, models.DO_NOTHING, blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'players'


class QuestionnaireResponses(models.Model):
    id = models.BigAutoField(primary_key=True)
    question = models.ForeignKey('Questionnaires', models.DO_NOTHING)
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
    sport = models.ForeignKey('Sports', models.DO_NOTHING)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'questionnaires'


class RoleHasPermissions(models.Model):
    permission = models.OneToOneField(Permissions, models.DO_NOTHING, primary_key=True)  # The composite primary key (permission_id, role_id) found, that is not supported. The first column is selected.
    role = models.ForeignKey('Roles', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'role_has_permissions'
        unique_together = (('permission', 'role'),)


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


class UserAvailabilities(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey('users', models.DO_NOTHING)
    type = models.CharField(max_length=8)
    title = models.CharField(max_length=255, blank=True, null=True)
    valid_from = models.DateTimeField(blank=True, null=True)
    valid_until = models.DateTimeField(blank=True, null=True)
    is_default = models.IntegerField()
    is_active = models.IntegerField()
    priority = models.PositiveIntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user_availabilities'


class UserAvailabilityDayDurationPrices(models.Model):
    availability_day_duration = models.ForeignKey(AvailabilityDayDurations, models.DO_NOTHING)
    min_players = models.PositiveIntegerField()
    max_players = models.PositiveIntegerField()
    price = models.DecimalField(max_digits=8, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'user_availability_day_duration_prices'


class userspecialties(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey('users', models.DO_NOTHING)
    specialty = models.ForeignKey(Specialties, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'user_specialties'
        unique_together = (('user', 'specialty'),)


class usersports(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey('users', models.DO_NOTHING)
    sport = models.ForeignKey(Sports, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'user_sports'
        unique_together = (('user', 'sport'),)


class users(models.Model):
    id = models.BigAutoField(primary_key=True)
    user_name = models.CharField(unique=True, max_length=20)
    uuu_id = models.CharField(unique=True, max_length=255)
    email = models.CharField(unique=True, max_length=96)
    first_name = models.CharField(max_length=32, blank=True, null=True)
    last_name = models.CharField(max_length=32, blank=True, null=True)
    phone_number = models.CharField(unique=True, max_length=16, blank=True, null=True)
    gender = models.CharField(max_length=6)
    date_of_birth = models.DateField(blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    state = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    user_type = models.CharField(max_length=17)
    user_type_id = models.PositiveBigIntegerField(blank=True, null=True)
    password = models.CharField(max_length=255)
    old_password = models.CharField(max_length=255, blank=True, null=True)
    code = models.CharField(max_length=40, blank=True, null=True)
    ip = models.CharField(max_length=40, blank=True, null=True)
    provider = models.CharField(max_length=255, blank=True, null=True)
    provider_id = models.CharField(max_length=255, blank=True, null=True)
    otp = models.CharField(max_length=255, blank=True, null=True)
    otp_expires_at = models.DateTimeField(blank=True, null=True)
    otp_used_at = models.DateTimeField(blank=True, null=True)
    otp_attempts = models.PositiveIntegerField()
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
