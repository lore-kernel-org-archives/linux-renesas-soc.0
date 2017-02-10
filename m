Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v2 2/4] gen-image: Implement option to parse an input crop
Date: Fri, 10 Feb 2017 13:30:06 +0000
Message-Id: <aba1b1a68c194a9d79af351c74d803822274beda.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
In-Reply-To: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Allow the user to specify an input crop in the form (X,Y)/WxH

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 src/gen-image.c | 132 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 132 insertions(+)

diff --git a/src/gen-image.c b/src/gen-image.c
index 31d42e0211db..088e8b26f648 100644
--- a/src/gen-image.c
+++ b/src/gen-image.c
@@ -95,6 +95,13 @@ struct format_info {
 	struct format_yuv_info yuv;
 };
 
+struct image_rect {
+	int left;
+	int top;
+	unsigned int width;
+	unsigned int height;
+};
+
 struct image {
 	const struct format_info *format;
 	unsigned int width;
@@ -127,6 +134,8 @@ struct options {
 	bool rotate;
 	unsigned int compose;
 	struct params params;
+	bool crop;
+	struct image_rect inputcrop;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1076,6 +1085,25 @@ static void image_flip(const struct image *input, struct image *output,
 }
 
 /* -----------------------------------------------------------------------------
+ * Image Cropping
+ */
+
+static void image_crop(const struct image *input, const struct image *output,
+		       const struct image_rect *crop)
+{
+	unsigned int offset = (crop->top * input->width + crop->left) * 3;
+	const uint8_t *idata = input->data + offset;
+	uint8_t *odata = output->data;
+	unsigned int y;
+
+	for (y = 0; y < output->height; ++y) {
+		memcpy(odata, idata, output->width * 3);
+		odata += output->width * 3;
+		idata += input->width * 3;
+	}
+}
+
+/* -----------------------------------------------------------------------------
  * Look Up Table
  */
 
@@ -1363,6 +1391,21 @@ static int process(const struct options *options)
 		input = rgb;
 	}
 
+	if (options->crop) {
+		struct image *cropped;
+
+		cropped = image_new(input->format, options->inputcrop.width,
+				options->inputcrop.height);
+		if (!cropped) {
+			ret = -ENOMEM;
+			goto done;
+		}
+
+		image_crop(input, cropped, &options->inputcrop);
+		image_delete(input);
+		input = cropped;
+	}
+
 	/* Scale */
 	if (options->output_width && options->output_height) {
 		output_width = options->output_width;
@@ -1596,6 +1639,7 @@ static void usage(const char *argv0)
 	printf("			or percentages ([0%% - 100%%]). Defaults to 1.0\n");
 	printf("-c, --compose n		Compose n copies of the image offset by (50,50) over a black background\n");
 	printf("-C, --no-chroma-average	Disable chroma averaging for odd pixels on output\n");
+	printf("    --crop (X,Y)/WxH            Crop the input image\n");
 	printf("-e, --encoding enc	Set the YCbCr encoding method. Valid values are\n");
 	printf("			BT.601, REC.709, BT.2020 and SMPTE240M\n");
 	printf("-f, --format format	Set the output image format\n");
@@ -1628,11 +1672,13 @@ static void list_formats(void)
 
 #define OPT_HFLIP	256
 #define OPT_VFLIP	257
+#define OPT_CROP	260
 
 static struct option opts[] = {
 	{"alpha", 1, 0, 'a'},
 	{"clu", 1, 0, 'L'},
 	{"compose", 1, 0, 'c'},
+	{"crop", 1, 0, OPT_CROP},
 	{"encoding", 1, 0, 'e'},
 	{"format", 1, 0, 'f'},
 	{"help", 0, 0, 'h'},
@@ -1649,6 +1695,84 @@ static struct option opts[] = {
 	{0, 0, 0, 0}
 };
 
+static int parse_crop(struct image_rect *crop, char *optarg, char **endp)
+{
+	/* (X,Y)/WxH */
+	char *endptr = optarg;
+
+	if (*endptr != '(') {
+		printf("Invalid crop argument\n");
+		*endp = endptr;
+		return 1;
+	}
+
+	crop->left = strtol(endptr + 1, &endptr, 10);
+	if (*endptr != ',') {
+		printf("Invalid crop position\n");
+		*endp = endptr;
+		return 1;
+	}
+
+	if (crop->left < 0) {
+		printf("Invalid negative crop\n");
+		*endp = endptr - 1;
+		return 1;
+	}
+
+	crop->top = strtol(endptr + 1, &endptr, 10);
+	if (*endptr != ')') {
+		printf("Invalid crop position\n");
+		*endp = endptr;
+		return 1;
+	}
+
+	if (crop->top < 0) {
+		printf("Invalid negative crop\n");
+		*endp = endptr - 1;
+		return 1;
+	}
+
+	endptr++;
+
+	if (*endptr != '/') {
+		printf("Invalid crop argument\n");
+		*endp = endptr;
+		return 1;
+	}
+
+	crop->width = strtol(endptr + 1, &endptr, 10);
+	if (*endptr != 'x') {
+		printf("Invalid crop size\n");
+		*endp = endptr;
+		return 1;
+	}
+
+	crop->height = strtol(endptr + 1, &endptr, 10);
+	if (*endptr != 0) {
+		printf("Invalid crop size\n");
+		*endp = endptr;
+		return 1;
+	}
+
+	return 0;
+}
+
+void print_streampos(const char *p, const char *end)
+{
+	int pos;
+
+	pos = end - p + 1;
+
+	if (pos < 0)
+		pos = 0;
+	if (pos > (int) strlen(p))
+		pos = strlen(p);
+
+	printf("\n");
+	printf(" %s\n", p);
+	printf(" %*s\n", pos, "^");
+}
+
 static int parse_args(struct options *options, int argc, char *argv[])
 {
 	char *endptr;
@@ -1809,6 +1933,14 @@ static int parse_args(struct options *options, int argc, char *argv[])
 			options->vflip = true;
 			break;
 
+		case OPT_CROP:
+			if (parse_crop(&options->inputcrop, optarg, &endptr)) {
+				print_streampos(optarg, endptr);
+				return 1;
+			}
+			options->crop = true;
+			break;
+
 		default:
 			printf("Invalid option -%c\n", c);
 			printf("Run %s -h for help.\n", argv[0]);
-- 
git-series 0.9.1
