Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83443E4AC;
	Thu, 30 Jul 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431617; cv=none; b=XPrT0FYakTuTAp2QAZuZY4tKKPqf0q/KOaoujBadQCPwE24uLP/y7Qa/dNyn8C1d3iWOo14SrsFNP4VPEql+0yfoy5aJnN2vQwDXaJqCPmfLcu2jzuKvpTIGLP4o7RTpta8dLi/AIPhWWxPjJy2pDf34PoPDcuY0MnUZJ8VXKYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431617; c=relaxed/simple;
	bh=tF9JPAwVTzcDnEBmsOKzWa6C8Afsw2RrGKJ/EyZ60DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pg4Fjs/3tOxwvtMMzUnkyhkbp5Smi5/KHCKbd/DFBkqcz7xZDs6z3whLEGW9XBvM34Rd8AN2Mhfy3Igy+Cvqut90msRUD+WSrcdEKrt89DKvwIFRM6Q8lNSY1zxp+LAuRsWohk8tUI7pUXWIMkTxK1r1lbjZh18kQFpp8aap0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lXzNZPin; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C6ddLNkS; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lXzNZPin";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C6ddLNkS"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 08181EC01C0;
	Thu, 30 Jul 2026 13:13:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 30 Jul 2026 13:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431609;
	 x=1785518009; bh=xZIvkKoHxfgr9Jno0TGIhBjlWoDHulIkKZzB5FBfZJ8=; b=
	lXzNZPinh8kGRzLh5ISZI0iO4crk8D4XF+VwRF6Smt54plbqfUoNFkRtXwAq4k0I
	vGCPTTN+QuaTK8ehSFWcuJy9g4gV1yNPYvbpRpD8bAhb9NZ+MAMO0F45Z44wUwxO
	hiW3I+ooihf3g5z+ueXySO97gl5oyge7QZxc+2v95jAy3feInUPb/ZkPawPDLY4F
	4vhDOKxBrHYQSY1IvrJ9/hgC2cQwZtmGHhi36L3qavSvw/OFgD2BOxA/82DYLZKK
	3Ytkowf2KpralS/lhwOlR+fFEbxkfBHm1r+itLDpGyanEhg08WL2T7Np4QHeSkPz
	SHIGI2OdlXekmo0u6Z+fAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431609; x=
	1785518009; bh=xZIvkKoHxfgr9Jno0TGIhBjlWoDHulIkKZzB5FBfZJ8=; b=C
	6ddLNkSnlr4Ras3t5EEKYTL/Lo+EfhGzAoWGrWdUbnbZW8PfAC9QaUr8xTuIb+YU
	ExQmoiy6bz9RAGi0UsnxGvpob5yy+F55Ow5wGqIgvbZdKOS26JtBh7fYmv6RQZbz
	ejMhR8rcc0H5BQ7wtSmrT1ZAbvgjIkWA26NXV22bsWBRxsTVcxvTYvEx74lC1WD0
	jRRfTY/wXYj3JOyn7GsuFYTsUYv8Rk9Kszr3gZWS2RjIFUYDuSOcDKMZKnrISSse
	5TJ4i/4QL0rC6jmhN3b7yfFISPw9gZh4bJnufnVVzQXqvlMrwOTuwVrzFZyZHsnI
	z/v5ZqqaGPYFEG+G7pIvg==
X-ME-Sender: <xms:OIZram9rBHHPzaw7nAo7Tpuj1z-LSaEvt1iAFn0iikNIsqkzz2MVkg>
    <xme:OIZrasvvvTyP1QjMS0YTXeJqpovHSacymRR10kyoPc-FMy4hnipaOx0sobZ2WeQM-
    Afa3VhFJGpNxscpSr_54MpHwj72sNv-YS496_ahhrm_xvupnEcmUZ2w>
X-ME-Received: <xmr:OIZram3kMy9cHmxZpwkrxxnMDvNGPYlVN0cH2EyqHFW0cz2Wn6BrT568CXOPz5og9RHefQpJScTcSQi2YfP93_fUUuXCJSE>
X-ME-Proxy-Cause: dmFkZTF07znR1cOvOBQn+EZER5ns3tmiMy5NUHQvdd5Z0fNrdMM9h7MbP7+GksfPtS7/1U
    pbvEAtzOYwe/VUfXgLXiTlfU5t/R1iCU6ZJEOsty3ubB5ehJqcum9OE7oGRRQDL9xfDRIK
    IJPzjqxA4ZdkREQiPshBlbxzbL60DrO4L2/LXxHcX43hG02n/xFutuZwyrFoUVQAOk2lSb
    UbuqpyeNpEtK89wcsLj4NzSX6CKqzD/RVhTRJVxLQiHW/zEDjblEQ73f+/OqAP/iQrvQhs
    4FsCqFhhBY6AH14Nv6+K2625maneF7QxlMpmX5gX9dknU7Q7/gZ7JLfYbad0TmjRWiCjGa
    xBabwcGqg1D6UZvtBFc7FMpTjTuUAnIpIkRXq6Vx3ydokkfXskzns9EEepTB9uDmc45Gnf
    DrE2XUEZ6wDkoIHgerRTAfcpE1UnoooSsZtOsTXmiffosXJs6JfEuXXi35LYJckQTGxCKN
    Z14qr4D8MUb7VvjbtqqKSq34CBFtWDKsEv38GlComcgL95hkZRkVKfrfFj9jrqDPE2jNgC
    nkF/i6ZEE+3gQgsXIxL8sdL2MFIkOYrz0eXec6N9Gl8P3kXRwgNqiwHSZAx6M47B7d/kry
    QGJDEuMETc2oEN2KiiGkHukgLXFD04jV+uhKspRaRo7i2q1rNU5xoDQo28vA
X-ME-Proxy: <xmx:OIZrahRBQJUcWEBqF1AQcQGGq0CMY_yA3wr9RoHH7Mqt9MYMiPzKeg>
    <xmx:OIZraqdvvibF1zjEpsjaCWZGCQnbuofBShRrUMeF22VYNavqw7z2qw>
    <xmx:OIZraica0rlr9lpBsi_MzfTwD1is8yXCESPo59wxe_1vlGZ51CN0pA>
    <xmx:OIZrak1wNscNk0wNHNDGRFcw4atR0SMjuQVWX6tGXTbi3zpEIdGy3Q>
    <xmx:OYZrappme3PURP4hhX7x5RAC0btaGZGNv0Bita8_Yj4_QD7v4_tCdtfl>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:28 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v11 01/13] media: Add RPPX1_PARAMS and RPPX1_STATS meta formats
Date: Thu, 30 Jul 2026 19:12:29 +0200
Message-ID: <20260730171241.483870-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>

Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
parameters and statistics buffers. These formats are used by the driver
to exchange ISP configuration and 3A statistics with userspace through
the extensible parameters framework.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v10
- s/V4L2_META_FMT_RPP_X1/V4L2_META_FMT_RPPX1/ change done by Jacopo,
  thanks!
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..17ba1ae70735 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
+	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..5373dba640fa 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Dreamchip RPP-X1 ISP */
+#define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
+#define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.55.0

