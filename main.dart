OSMFlutter(
controller:mapController,
userTrackingOption: UserTrackingOption(
enableTracking: true,
unFollowUser: false,
),
initZoom: 12,
minZoomLevel: 8,
maxZoomLevel: 14,
stepZoom: 1.0,
userLocationMarker: UserLocationMaker(
personMarker: MarkerIcon(
icon: Icon(
Icons.location_history_rounded,
color: Colors.red,
size: 48,
),
),
directionArrowMarker: MarkerIcon(
icon: Icon(
Icons.double_arrow,
size: 48,
),
),
),
roadConfiguration: RoadOption(
roadColor: Colors.yellowAccent,
),
markerOption: MarkerOption(
defaultMarker: MarkerIcon(
icon: Icon(
Icons.person_pin_circle,
color: Colors.blue,
size: 56,
),
)
),
);