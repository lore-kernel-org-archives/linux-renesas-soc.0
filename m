Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33199 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751617AbdKOJAB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 04:00:01 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] v4l2-drm-example: Make the exporter selectable
Date: Wed, 15 Nov 2017 11:00:01 +0200
Message-Id: <20171115090001.3005-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The new -e command line option allows selecting the exporter between the
V4L2 and DRM side. DRM is used as the exporter by default.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 v4l2-drm-example/dmabuf-sharing.c | 99 +++++++++++++++++++++++++++++++++++----
 1 file changed, 89 insertions(+), 10 deletions(-)

This patch is against the master branch of
git://git.infradead.org/users/kmpark/public-apps and is available in my clone
tree at git://git.ideasonboard.org/samsung-public-apps.git.

Andrzej, if the patch is acceptable, could you merge it upstream ?

diff --git a/v4l2-drm-example/dmabuf-sharing.c b/v4l2-drm-example/dmabuf-sharing.c
index 5e1fb6a8f0c3..e2f1a4228af8 100644
--- a/v4l2-drm-example/dmabuf-sharing.c
+++ b/v4l2-drm-example/dmabuf-sharing.c
@@ -69,6 +69,11 @@ static inline int warn(const char *file, int line, const char *fmt, ...)
 #define WARN_ON(cond, ...) \
 	((cond) ? warn(__FILE__, __LINE__, __VA_ARGS__) : 0)
 
+enum dmabuf_exporter {
+	DMABUF_EXPORTER_DRM = 0,
+	DMABUF_EXPORTER_V4L2,
+};
+
 struct setup {
 	char module[32];
 	int conId;
@@ -85,6 +90,7 @@ struct setup {
 	unsigned int use_compose : 1;
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
+	enum dmabuf_exporter exporter;
 };
 
 struct drm_device {
@@ -105,10 +111,12 @@ struct drm_device {
 	unsigned int height;
 
 	struct v4l2_rect compose;
+	int export;
 };
 
 struct v4l2_device {
 	const char *devname;
+	enum v4l2_memory memory;
 	int fd;
 
 	struct v4l2_pix_format format;
@@ -149,6 +157,7 @@ static void usage(char *name)
 
 	fprintf(stderr, "\nGeneric options:\n\n");
 	fprintf(stderr, "\t-b buffer_count\tset number of buffers\n");
+	fprintf(stderr, "\t-e <exporter>\tset the exporter ('v4l2' or 'drm')\n");
 	fprintf(stderr, "\t-h\tshow this help\n");
 }
 
@@ -170,13 +179,21 @@ static int parse_args(int argc, char *argv[], struct setup *s)
 
 	strcpy(s->video, "/dev/video0");
 
-	while ((c = getopt(argc, argv, "b:F:f:hi:M:o:p:S:s:t:")) != -1) {
+	while ((c = getopt(argc, argv, "b:e:F:f:hi:M:o:p:S:s:t:")) != -1) {
 		switch (c) {
 		case 'b':
 			ret = sscanf(optarg, "%u", &s->buffer_count);
 			if (WARN_ON(ret != 1, "incorrect buffer count\n"))
 				return -1;
 			break;
+		case 'e':
+			if (strcmp(optarg, "v4l2") == 0)
+				s->exporter = DMABUF_EXPORTER_V4L2;
+			else if (strcmp(optarg, "drm") == 0)
+				s->exporter = DMABUF_EXPORTER_DRM;
+			else if (WARN_ON(1, ""))
+				return -1;
+			break;
 		case 'F':
 			if (WARN_ON(strlen(optarg) != 4, "invalid fourcc\n"))
 				return -1;
@@ -284,13 +301,49 @@ fail_prime:
 
 fail_gem:
 	memset(&gem_destroy, 0, sizeof gem_destroy);
-	gem_destroy.handle = b->bo_handle,
+	gem_destroy.handle = b->bo_handle;
 	ret = ioctl(dev->fd, DRM_IOCTL_MODE_DESTROY_DUMB, &gem_destroy);
 	WARN_ON(ret, "DESTROY_DUMB failed: %s\n", ERRSTR);
 
 	return -1;
 }
 
+static int drm_buffer_import(struct drm_device *dev, struct buffer *b,
+			     const struct v4l2_pix_format *fmt)
+{
+	struct drm_prime_handle prime;
+	struct drm_gem_close gem_close;
+	int ret;
+
+	memset(&prime, 0, sizeof prime);
+	prime.fd = b->dbuf_fd;
+	ret = ioctl(dev->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime);
+	if (WARN_ON(ret, "PRIME_FD_TO_HANDLE failed: %s\n", ERRSTR))
+		return -1;
+	b->bo_handle = prime.handle;
+
+	uint32_t offsets[4] = { 0 };
+	uint32_t pitches[4] = { fmt->bytesperline };
+	uint32_t bo_handles[4] = { b->bo_handle };
+	unsigned int fourcc = dev->format;
+	if (!fourcc)
+		fourcc = fmt->pixelformat;
+	ret = drmModeAddFB2(dev->fd, fmt->width, fmt->height, fourcc, bo_handles,
+		pitches, offsets, &b->fb_handle, 0);
+	if (WARN_ON(ret, "drmModeAddFB2 failed: %s\n", ERRSTR))
+		goto fail_gem;
+
+	return 0;
+
+fail_gem:
+	memset(&gem_close, 0, sizeof gem_close);
+	gem_close.handle = b->bo_handle;
+	ret = ioctl(dev->fd, DRM_IOCTL_GEM_CLOSE, &gem_close);
+	WARN_ON(ret, "GEM_CLOSE failed: %s\n", ERRSTR);
+
+	return -1;
+}
+
 static int drm_find_crtc(struct drm_device *dev)
 {
 	int ret = -1;
@@ -406,8 +459,13 @@ static void drm_init(struct drm_device *dev, const struct v4l2_pix_format *fmt,
 
 	/* TODO: add support for multiplanar formats */
 	for (unsigned int i = 0; i < num_buffers; ++i) {
-		ret = drm_buffer_create(dev, &buffers[i], fmt);
-		BYE_ON(ret, "failed to create buffer%d\n", i);
+		if (dev->export) {
+			ret = drm_buffer_create(dev, &buffers[i], fmt);
+			BYE_ON(ret, "failed to create buffer%d\n", i);
+		} else {
+			ret = drm_buffer_import(dev, &buffers[i], fmt);
+			BYE_ON(ret, "failed to import buffer%d\n", i);
+		}
 	}
 	printf("buffers ready\n");
 
@@ -452,7 +510,8 @@ static void drm_page_flip(struct drm_device *dev, struct buffer *buffer)
 	}
 }
 
-static void v4l2_init(struct v4l2_device *dev, unsigned int num_buffers)
+static void v4l2_init(struct v4l2_device *dev, unsigned int num_buffers,
+		      struct buffer *buffers)
 {
 	int ret;
 
@@ -494,7 +553,7 @@ static void v4l2_init(struct v4l2_device *dev, unsigned int num_buffers)
 	memset(&rqbufs, 0, sizeof(rqbufs));
 	rqbufs.count = num_buffers;
 	rqbufs.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	rqbufs.memory = V4L2_MEMORY_DMABUF;
+	rqbufs.memory = dev->memory;
 
 	ret = ioctl(dev->fd, VIDIOC_REQBUFS, &rqbufs);
 	BYE_ON(ret < 0, "VIDIOC_REQBUFS failed: %s\n", ERRSTR);
@@ -502,6 +561,22 @@ static void v4l2_init(struct v4l2_device *dev, unsigned int num_buffers)
 		"%u of %u buffers\n", rqbufs.count, num_buffers);
 
 	dev->format = fmt.fmt.pix;
+
+	if (dev->memory == V4L2_MEMORY_DMABUF)
+		return;
+
+	for (unsigned int i = 0; i < num_buffers; ++i) {
+		struct v4l2_exportbuffer expbuf;
+		memset(&expbuf, 0, sizeof(expbuf));
+		expbuf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		expbuf.index = i;
+
+		ret = ioctl(dev->fd, VIDIOC_EXPBUF, &expbuf);
+		BYE_ON(ret < 0, "VIDIOC_EXPBUF failed: %s\n", ERRSTR);
+		buffers[i].dbuf_fd = expbuf.fd;
+
+		printf("dbuf_fd = %d\n", expbuf.fd);
+	}
 }
 
 static void v4l2_queue_buffer(struct v4l2_device *dev, const struct buffer *buffer)
@@ -511,9 +586,10 @@ static void v4l2_queue_buffer(struct v4l2_device *dev, const struct buffer *buff
 
 	memset(&buf, 0, sizeof buf);
 	buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	buf.memory = V4L2_MEMORY_DMABUF;
+	buf.memory = dev->memory;
 	buf.index = buffer->index;
-	buf.m.fd = buffer->dbuf_fd;
+	if (dev->memory == V4L2_MEMORY_DMABUF)
+		buf.m.fd = buffer->dbuf_fd;
 
 	ret = ioctl(dev->fd, VIDIOC_QBUF, &buf);
 	BYE_ON(ret, "VIDIOC_QBUF(index = %d) failed: %s\n", buffer->index, ERRSTR);
@@ -562,6 +638,8 @@ int main(int argc, char *argv[])
 
 	memset(&v4l2, 0, sizeof v4l2);
 	v4l2.devname = s.video;
+	v4l2.memory = s.exporter == DMABUF_EXPORTER_V4L2
+		    ? V4L2_MEMORY_MMAP : V4L2_MEMORY_DMABUF;
 
 	if (s.use_wh) {
 		v4l2.format.width = s.w;
@@ -570,13 +648,13 @@ int main(int argc, char *argv[])
 	if (s.in_fourcc)
 		v4l2.format.pixelformat = s.in_fourcc;
 
-	v4l2_init(&v4l2, s.buffer_count);
-
 	struct buffer buffers[s.buffer_count];
 
 	for (unsigned int i = 0; i < s.buffer_count; ++i)
 		buffers[i].index = i;
 
+	v4l2_init(&v4l2, s.buffer_count, buffers);
+
 	memset(&drm, 0, sizeof drm);
 	drm.module = s.module;
 	drm.modestr = s.modestr;
@@ -585,6 +663,7 @@ int main(int argc, char *argv[])
 	drm.height = v4l2.format.height;
 	drm.crtc_id = s.crtId;
 	drm.con_id = s.conId;
+	drm.export = s.exporter == DMABUF_EXPORTER_DRM;
 
 	drm_init(&drm, &v4l2.format, s.buffer_count, buffers);
 
-- 
Regards,

Laurent Pinchart
