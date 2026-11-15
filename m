Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769866;
	b=B4cXXzitE/Rd9mTYXsycTFCoSOLYph4CnIH+ILZkg9hy0Atwpt/Gt//ap5hGWcQazvRk
	 vqs1nWt3f01kj5NsCyVkjvr4ba4JJbfsqNdWP04e03NfjrVz2so06Ab+sW35U4nnIgbXK
	 wahzvjwQnyJdI+Q7IMxu480oH3KkQNnt41G6J66EcCK4FpKbzg/vOZ4UA05sA1UvZYUWc
	 oCy4zLEiBsF2IIh8jSs8O0lgwDNSC3KTFNwcl6XNAz/QXERlnGMR4r82+UYUuGOhvnezV
	 67wc0fvDFlmLJ8t9JBOlmcronSeft/Y9T+P4mmh4SXjCZp618puRSK7VyvM6cNpEQhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769866;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v/7htNV0I5fN/nH96MjeLovPELil50iZdMFXQcwDKmY=;
	b=goIQH3+PVw2LqjFomL3+z6k5zAvWDSqkdY2CkqKiXbmzb1/zjyzZhl2D95pQYPmkECMc
	 xFNGp7YmbCb7agAGysriDIrj0T9LsROmSmZS7jB1zzi8XLi/9unjhpkF/4W8VDhVYUqOW
	 NaB4uox7ltWYXpbZA+mvOWYsMOBeiDrFYQKVF9dmvirEDrJFiF1fkJleamUchNbVb8TFP
	 QDxGwveaCkK/U3qVg3Kp97/MfIhrwt2KVBqWE+zH744aU7U8CWhwDVatNW/QSKPz8FISR
	 Rubn6NNklJh9/YW6ptZxKM2YwYjqA30Wr4Ymng+wsHfFjxXFF6OolEBgwDBBXwZvH/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="mownB/mY";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=052Np7yq;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D47606A323
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Nov 2026 19:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D47606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=mownB/mY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=052Np7yq
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 766FC1400043
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Nov 2026 14:11:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 15 Nov 2026 14:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1794769864; x=1794856264; bh=v/
	7htNV0I5fN/nH96MjeLovPELil50iZdMFXQcwDKmY=; b=mownB/mYA5f4cfhDG4
	BB3xVfhe9jwT7WB/MrBqAo9u6WBIU4pUPMrxkIu4U/sOpKZRI+J8Ua8sZbGCELrY
	kK8yWHt5bw/gjRTutQpfUm2LrrLWyB88qMJhwhHooldgUzY/LUWYpFL3GYyicyWa
	G/CnyhGMH/+qEzi0wNKhLqyWNlVsBD/e6hLm/+ATHGiSYk6TQft9ufz7OFGH3JH/
	p7Q7XFDRoOG9vk2119t+JC+kXOq8LkjjRrGgwUj9/hn+bZEIQWEBeQwMmhxPrXlP
	/OPTChWv1R/uwL56DrBV12vXPymBsIMkcf3MtxBsbY+9l9/mVg/NuhohlXTO1psS
	TDGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794769864; x=1794856264; bh=v/7htNV0I5fN/nH96MjeLovPELil
	50iZdMFXQcwDKmY=; b=052Np7yqCtO1TT8dTRQgSgPqX631NqdLCerLl/ko+g4F
	T7IQ2ifNPanlbEuAbSHzGlGj2HC/S0FteghLYXoBz/f1dfd8HLudCNeWGR49Rk/F
	vDIKaalGTqjLMrTVH0XkL2D8XGDW2wGvbwG/2GixZtFZTdJdDRbCZNMenbKfSvbD
	tZBDHLWvnHDJ+eukKUtR9iFO13y/H7KAjz4L8dlQCjDZSI8y1FTOqBR0KZdWsxnL
	nHNdcG6rDbBqAxV2vlWqQaIs78TQPuqWC/4rWn9iZDiaN7ANGVxofalil22by6p4
	LRcUk32gKNNcFMcqe2zoeJHNcR1MA6dEm4z6NZzBoQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794769864; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:meKGlARtB9aezWAzVuKc4bB3EknDa/BSFW2/Qg60vhdxQyt
	ZG3PpNCeRYLTMRbHa2LIsUD+9Nr+F93x5u8ZSxkXVxub3kI+6yi8mG5UCho9jand
	uPmwgfMGIvYWCQm6FL4P9IwgjzVtCzeQ0TFf9YqNpoRYeAq7zWc8kOdWRA/x50Og
	Qx+Wwqc5z3Oy0kw9Jb8udV4fGxIvp9MMplyRxiU98/4nG3MMGBfvbfu8DtRf0pU9
	dEeqFnnIDs5krF0mp8FSiax2R/TlDDJ1aSvltXpWl4nHqiLkVIV+GQ6UI/8RvCZz
	uR4bBGtfQpEa9B7LIqwyavf3TCSLUaws3yIalJA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:KClCmEXHoXKbAxauuXMfRQfpgRLPuowDM6dMo576bEM=:wcfYjWs6dFdcNf6FhI2Fmoi6dQUWF8Uu8boy79ySc00=;
X-ME-Sender: <xms:yAP6amUKjmQhf0WCE3ZfbAZqz5GMwLah-U5jPm7GU4FdYAFA3F39KA>
    <xme:yAP6athJHSj8WFQ955cYMiO1SZ1co20FdfBzqLRogl0rff9UzgRz6AFMnrj__Q8vC
    OmUMNphcMvZFIreYYRl6wBA0jDXDZX5xh7xgWEg5KrJqTh8bhOyEQK98w>
X-ME-Received: <xmr:yAP6apb3-NWpy6WOE8Hk0zJYXkm_KLJTBcuM14txB4zAYc42soEFwLY6sBwn9-sjoAF-cVOY6_wlnDV2c0A3m6fFnkxgGwU>
X-ME-Proxy-Cause: dmFkZTF7CT48AofC5Fqn3oPULi6etSTNJTTDlUTIjIcc5gam3EKX/VBy1O9NF4zFRKwX3z
    ufBuDABUJG2lxtlE7ggzN4R6tEuj/igzlCwHcxhvxdbETHeRqEv0xg1KY9rmhyPnwVojY1
    vfnUdQri/pLXt8PG6OEiB8JD9xILP+nnqQVgn6N43EYxUrUX3xc+gq4ML+5Gk40ZcmeZsR
    b3uiB4thbyRoWWBFuFTu0XN/9uyQe+pRNLelD4RMMxA6/Ut1zlmqCr0qd5Z1tZxRMNSdHA
    SpBaAqBVC+k7UMnwsBVD7ZfGw2z0twxxDRYIHT3ShYb1JROM85h/1YxAmKUba2le45yBaK
    WAh9ROEVIXU0jQoWwkbi2O+0PYP+kBEdrDI4m/IAQU7Qd3z+ERwz5RBOvuxYyVn7GlaE/K
    JK1GAmVVIXePdHt9MF8TxJ4dommP52EZffC5Biau3rKDQd1szyLDK0+TL4Y0Up9KVIAQRQ
    xJUBjWflzxx9/qRVe/Mgn96T3XyN3eRq/wFgMi5S37gIs0HMumHk1Mg6X0clRVdN5M2pyx
    JmxDduseTQ84JwpiLgjXJlZF5BIrcOBn99OAenBXeXXBldlQqUY5Dq/B2YI2auU1FTUnaq
    x0Sv/SoHUvrBQx4v1X5rkDPB9bmsHLw07IU6DZvlkPak7b2rvpTfRoTEbxJg
X-ME-Proxy: <xmx:yAP6aioziBp4LC2kFzdviiFHellIlDkaVCu4VcLxWyCQ8QSMq5wBbw>
    <xmx:yAP6auNg8StwTL-EUhPoNLkwDAVhinqRGZCgv5iyppySFL8uIJkprw>
    <xmx:yAP6atqgxUxeWm3JZdOcyWoxaa3MNVVpCdaiNwhwRcW_AMIWD5tO-A>
    <xmx:yAP6ajctVttizHSSJVKEuWM8jlaIO6I2U4dp0QibdUvIAWZdpjGrMQ>
    <xmx:yAP6alYWal-MqcmG1TezR8vrzEhlqPSqS_J4SitJDeXCK4SGpuB7vhjP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 14:11:03 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] media: uapi: videodev2: Add 20-, 24- and 28-bit
 bayer pixel formats
Date: Sun, 15 Nov 2026 20:10:04 +0100
Message-Id: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0Jm7ZhpA6a68h6ERWlHGGOAtFgxh
 LsL6M7lS95/f4bIQTjCJZshcJIofbeCPmTgWts1jOJXBk36RGcymPKHRus9BvvCQSYsyFmljHb
 Oa1hnQ+CbTHuyrL4cn/Wd3bh1NqOVOPbhvX8mtXm/vKL/fFJIaMgaNkVR56q+Btt0dmTXHiNDt
 SzLB71q5WfFAAAA
X-Change-ID: 20260908-v4l2-add-raw-pix-50ca1182ccd2
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=wcfYjWs6dFdcNf6FhI2Fmoi6dQUWF8Uu8boy79ySc00=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+gO7IUfu9aQyAsQH19/FBHZjwUcBWQQrbzVcX
 ySxuUy82MaJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavoDuwAKCRAJtP95BPlN
 JO39D/9VD0iqn1oQFtpLVX7VBON0DFY2uqUgVVtRo9S+dkO+IHihN9jExvvGOCbz9AKzldNLla0
 F+x4tszRKr9+0VSUQHK3JjFWyPsF4Pzq18+SlEvxIgKXV/hAdFfMw4ZjjIRiMrkEQIfpUEci639
 t2gnoE6HgpN+c2drnXmqotr+RpvOdW9HvDfAt4SrrMYKYDVR0dUKkakkSzw6ZEQWSWYYeMfOP1W
 db4DldC5TXJlwapq5/K4S2AdWgj98EzqTglMwYcgjwJv/k3KscmABbY9OjLomnOIijZCa7wPaiR
 e3E0jCjDZL74XnVb+ZUvh+CJ/b16fQ/C1iTsJRvHz/aoIsKriLCNj0a5usxYUPcszFbkTfmSJZR
 ApfKAA0rnB6WOjYIcu+YJNIjW3FcFvC2AJVAmXoRFOyQvPX0TQ2n/bh2QraxFSFY7DWWOxm9DeR
 V+W7g2W+EYcOIq3GaPYlfPYk7VuhRSvYxijq8oYqg3/UfLtEqay9IoEsdNsRWuZC9G1BlVd2yy5
 r25HtKgrAvzyltHWpVIdq0hKvEyjv/4mIfFDZ3oKGqmcEoGiROlpejnGsj4Vui0H/nV8e3jFjLH
 D+U8cou6tf0ejxvR1TOyMtNeUoCoTcW0D2ZuzVUDCGd1yG+JJwDu7Nzl8NceQ7/xTqeXyUQtrxZ
 qQr9qEEhk8G865g==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Hello,

This series adds the pixel formats and documentation for the 20-, 24- 
and 28-bit Bayer formats. This is done in preparation of work on the 
Renesas R-Car video capture pipeline which will support these pixel
formats in multiple drivers. For this reason it is posted as a separate
series before the driver work.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes in v2:
- See individual patches.
- Link to v1: https://patch.msgid.link/20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se

To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Niklas Söderlund (3):
      media: uapi: videodev2: Add 20-bit Bayer formats
      media: uapi: videodev2: Add 24-bit Bayer formats
      media: uapi: videodev2: Add 28-bit Bayer formats

 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   3 +
 .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 103 +++++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 103 +++++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 103 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |   3 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  12 +++
 include/uapi/linux/videodev2.h                     |  12 +++
 7 files changed, 339 insertions(+)
---
base-commit: bf6c63ecc20a54aaac7a2fcbd6adaf6498388825
change-id: 20260908-v4l2-add-raw-pix-50ca1182ccd2

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

