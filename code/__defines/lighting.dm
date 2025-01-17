#define LIGHTING_INTERVAL       5     // Frequency, in 1/10ths of a second, of the lighting process.

#define LIGHTING_HEIGHT         1 // height off the ground of light sources on the pseudo-z-axis, you should probably leave this alone
#define LIGHTING_Z_FACTOR       10 // Z diff is multiplied by this and LIGHTING_HEIGHT to get the final height of a light source. Affects how much darker A Z light gets with each level transitioned.
#define LIGHTING_ROUND_VALUE    5 / 100 //Value used to round lumcounts, values smaller than 1/255 don't matter (if they do, thanks sinking points), greater values will make lighting less precise, but in turn increase performance, VERY SLIGHTLY.

#define LIGHTING_ICON 'icons/lighting_overlay.dmi' // icon used for lighting shading effects
#define LIGHTING_BASE_ICON_STATE "matrix"	// icon_state used for normal color-matrix based lighting overlays.
#define LIGHTING_STATION_ICON_STATE "tubedefault"	// icon_state used for lighting overlays that are just displaying standard station lighting.
#define LIGHTING_DARKNESS_ICON_STATE "black"	// icon_state used for lighting overlays with no luminosity.
#define LIGHTING_TRANSPARENT_ICON_STATE "blank"

#define LIGHTING_SOFT_THRESHOLD 0.01 // If the max of the lighting lumcounts of each spectrum drops below this, disable luminosity on the lighting overlays.
#define LIGHTING_BLOCKED_FACTOR 0.5	// How much the range of a directional light will be reduced while facing a wall.

// If defined, instant updates will be used whenever server load permits. Otherwise queued updates are always used.
//#define USE_INTELLIGENT_LIGHTING_UPDATES

#define TURF_IS_DYNAMICALLY_LIT(T) (isturf(T) && T:dynamic_lighting && T:loc:dynamic_lighting)
// mostly identical to above, but doesn't make sure T is valid first. Should only be used by lighting code.
#define TURF_IS_DYNAMICALLY_LIT_UNSAFE(T) (T:dynamic_lighting && T:loc:dynamic_lighting)

#define Z_ALL_TURFS(Z) block(locate(1, 1, Z), locate(world.maxx, world.maxy, Z))

#define LIGHTING_BASE_MATRIX \
	list            \
	(               \
		1, 1, 1, 0, \
		1, 1, 1, 0, \
		1, 1, 1, 0, \
		1, 1, 1, 0, \
		0, 0, 0, 0.98  \
	)               \

// Helpers so we can (more easily) control the colour matrices.
#define CL_MATRIX_RR 1
#define CL_MATRIX_RG 2
#define CL_MATRIX_RB 3
#define CL_MATRIX_RA 4
#define CL_MATRIX_GR 5
#define CL_MATRIX_GG 6
#define CL_MATRIX_GB 7
#define CL_MATRIX_GA 8
#define CL_MATRIX_BR 9
#define CL_MATRIX_BG 10
#define CL_MATRIX_BB 11
#define CL_MATRIX_BA 12
#define CL_MATRIX_AR 13
#define CL_MATRIX_AG 14
#define CL_MATRIX_AB 15
#define CL_MATRIX_AA 16
#define CL_MATRIX_CR 17
#define CL_MATRIX_CG 18
#define CL_MATRIX_CB 19
#define CL_MATRIX_CA 20

// Higher numbers override lower.
#define LIGHTING_NO_UPDATE 0
#define LIGHTING_VIS_UPDATE 1
#define LIGHTING_CHECK_UPDATE 2
#define LIGHTING_FORCE_UPDATE 3

// This color of overlay is very common - most of the station is this color when lit fully.
// Tube lights are a bluish-white, so we can't just assume 1-1-1 is full-illumination.
#define LIGHTING_DEFAULT_TUBE_R 0.96
#define LIGHTING_DEFAULT_TUBE_G 1
#define LIGHTING_DEFAULT_TUBE_B 1

//Some defines to generalise colours used in lighting.
//Important note on colors. Colors can end up significantly different from the basic html picture, especially when saturated
#define LIGHT_COLOR_RED        "#fa8282" //Warm but extremely diluted red. rgb(250, 130, 130)
#define LIGHT_COLOR_GREEN      "#64c864" //Bright but quickly dissipating neon green. rgb(100, 200, 100)
#define LIGHT_COLOR_BLUE       "#6496fa" //Cold, diluted blue. rgb(100, 150, 250)

#define LIGHT_COLOR_CYAN       "#7de1e1" //Diluted cyan. rgb(125, 225, 225)
#define LIGHT_COLOR_PINK       "#e17de1" //Diluted, mid-warmth pink. rgb(225, 125, 225)
#define LIGHT_COLOR_YELLOW     "#e1e17d" //Dimmed yellow, leaning kaki. rgb(225, 225, 125)
#define LIGHT_COLOR_BROWN      "#966432" //Clear brown, mostly dim. rgb(150, 100, 50)
#define LIGHT_COLOR_ORANGE     "#fa9632" //Mostly pure orange. rgb(250, 150, 50)
#define LIGHT_COLOR_PURPLE     "#a97faa" //Soft purple. rgb(169, 127, 170)
#define LIGHT_COLOR_VIOLET     "#b43cb8" //Deep purple. rgb(180, 60, 184)
#define LIGHT_COLOR_SCARLET    "#e85656" //Light red. rgb(232, 86, 86)

//These ones aren't a direct colour like the ones above, because nothing would fit
#define LIGHT_COLOR_FIRE       "#faa019" //Warm orange color, leaning strongly towards yellow. rgb(250, 160, 25)
#define LIGHT_COLOR_LAVA       "#c48a18" //Very warm yellow, leaning slightly towards orange. rgb(196, 138, 24)
#define LIGHT_COLOR_FLARE      "#fa644b" //Bright, non-saturated red. Leaning slightly towards pink for visibility. rgb(250, 100, 75)
#define LIGHT_COLOR_SLIME_LAMP "#afc84b" //Weird color, between yellow and green, very slimy. rgb(175, 200, 75)
#define LIGHT_COLOR_TUNGSTEN   "#fae1af" //Extremely diluted yellow, close to skin color (for some reason). rgb(250, 225, 175)
#define LIGHT_COLOR_HALOGEN    "#f0fafa" //Barely visible cyan-ish hue, as the doctor prescribed. rgb(240, 250, 250)
#define LIGHT_COLOR_EMERGENCY  "#ff3232" //Red color used by emergency lighting. rgb(255, 50, 50)

// Some angle presets for directional lighting.
#define LIGHT_OMNI null
#define LIGHT_SEMI 180
#define LIGHT_WIDE 90
#define LIGHT_NARROW 45
#define LIGHT_TUBE null