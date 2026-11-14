Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686138;
	b=WEj3T5krjqQAKwD4ld+VQQoybl5FptzdPZ3y8tow5SjXtet5IH9jEdJz931L21tHgem7
	 8bZjBimfgbw6mjF/v+drISaWAUNHJE0kHA3DjMSx6ApUOi58LICuBy13Nr+33aP9E7MRn
	 2b3VpTDb9P+wtWWBmgIdan3KeUFYbU803CwiPBWSIYIOuZCgpPhE3DzVF+kxKsHUqCxKS
	 qjKunuUZjH6Kf7tuCfqKrJEuKdD5zDhIT0oVJJv49rvtLYQ8QYJC+mMoZdIv+8KK+msTy
	 Xu08Ui8nCp7oKDY94ERXSKaneZShL7fUmX17X8qUEu4Hss7HFqnQrkEO9zF2XLZ0BBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686138;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WQuIAhwMhXcEVvSKHrzbBUO4q2Qrc2U99Z0AOIf43SY=;
	b=ov/kvnzDIhiJdCzT0u5/MEwChiaOdh/VhaG6xoQIzbFHMzzb3MAbAtqLLm3rZuhS8DIB
	 A83/D4pI3UkTpqmAJqQqHwnzz1Y8+brlblpFG6zbVc60DmJcvJ0z74Jfs0j8c5+DNjdYf
	 gOyJqOwm8gOXSqwdoxPxxv2ZM8mY3l/Get9WAOwfVWy4qnPEnQ/8vziOrEBQdgL6UnaGm
	 qSJyWB5liqebRq8U/tIR/dN0EnL07OVbHT38xNAb5t4UwSXARICOHTOJkbSVnUlJ9qTAD
	 3+O3QKfSxoUiCwFnhIk+Trdl5YtJBBAOWf8QrLT1jZYQt07c8CEqlRcMR0IT//F+rng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=PQV5lkEM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UOuey51h;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F6606A899
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Nov 2026 19:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9F6606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=PQV5lkEM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UOuey51h
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CFDA31400044
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Nov 2026 14:55:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 14 Nov 2026 14:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794686136;
	 x=1794772536; bh=WQuIAhwMhXcEVvSKHrzbBUO4q2Qrc2U99Z0AOIf43SY=; b=
	PQV5lkEMv48I/Gy2EuB4SzZh2z1dVyhLqlhJ7PmF/Yy8LySJI234rDDxYO68+97J
	Hmk6wp1IecjZi8pyiPI5X9kbw+wvtpn0DmFqBfvIhWumYMvzeisqOsb6eD96aypW
	CtkDTAjtVIpXteZiDMU51ZPoMzknIQexig3oGV0hvZ/tu0jpPipw2xKsGqBt6P/I
	BGjlUkaKRSCKgC7sUDnRk+zYKYxdYuv5uU8XhA0Zufl5efovGRXtSyALCmKTSlJc
	uCN47D7tjti/nYrAFb/qupvvMwPrvSZk/vUQz1UcvMLP1Y0zjn3G+8fTLbyLzfUs
	sfCmtDs3tvCJ5mYvDxqNJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794686136; x=
	1794772536; bh=WQuIAhwMhXcEVvSKHrzbBUO4q2Qrc2U99Z0AOIf43SY=; b=U
	Ouey51h5QS8EjcIYN2Ahm6KoFYPc/8qB79/7fjesqHJz/WXG1J31z34LsOh7E9A0
	PDmhaLNOfFftac+C2YAfAnZA9tDjon4nDXsKiGYAAthSbljXw/1pSrFqX91C/EPL
	2u14ZYVJu+eysLk52uutw5eoGZDgKW9Wq5A7XM2JRLJxPlaQhgi7tLdoCIBg5EsF
	H1wQxe44o4tGyG1NL+ghZseIxbts/2P5Og1LAaCZzron/3U+rOQdqB3knXugQOsl
	5cjbx21MOxe5Z6+fZAqqTE43cFpHZ1QQLKwdAfJo+AxpwV8W6HN1wcVTCgjt9Pxh
	GCS1P44iCwLjRrwmU3D7g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794686136; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:BOkxm0WytgsYTzTd0GqTwN1PagbxXBVGB8HvuM2jwDU1QuA
	Fo5CAwf8n+nCjulIUTmVZF7NX8ey1q6FYYUNW0nS8ipsXf8+D4cFZnRTW3ZF2IdF
	uqftsXNs9I6HLB/rZQ9LDnUVRGtXlNCnG6HopdNdzsvkMh20T9YmBot7Af7mO079
	LoTcYmnajAxuJXofhnbiByLNcTIkfVPkEYC5qWnNfpLagN8DCBowKjQY68hAli9l
	myWlqZZ9NPDcSTGF9IU57kI2oUKzj3gOVNxXNFfgAuxT4GZ+8PH3aIBTW6oWxjmZ
	kXKNI5TDxEA5q6Eo1bOq/zfv/FMMidj00twN8tg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+Nqt+g7ar3+Wn0gcd6/3Tqk02i2fq8FWIuX6qFjxvpM=:R/pnCzEHugppnU9TrzsNpnjrrTHF1+5jjjcS09z2O24=;
X-ME-Sender: <xms:uLz4as8k9j4Cv4t4vr4-laoSXTaz1qJUsoSz1oZS1NN-Mn9eEj-00A>
    <xme:uLz4ahbyXXLuV8TDg2tmlIm3NgB3ZPBF8o5GHvJdnz9HlsJyPQ-U1v68e03SyYwCi
    -Ga6X3zA09MsyUhHVUIrzC8z5Ztbxiy8qMd1ESyJK8ndqw_8cfiZjQO>
X-ME-Received: <xmr:uLz4al66tdMQeMUMuj5BKGa3nW-UC1Dv-2S844faz_JVr7agRMqMj4yW4Dpde2Kvrw9bIoeyzTsD9N_zHaXIo3l89Y2oUwE>
X-ME-Proxy-Cause: dmFkZTEmPVUMPzW/uVzvu9DgDp3nMJm61oFIDaC3QPBTICH5cN89yMpUl1KStN1ZjXFY3b
    Q2f1Uao/0Tu4woRnv05g2Zw725oyY1evcbi/fXJRPSHudv2BWLJayfP76gcySWs1MdJbDa
    nw1+g8tP01WTLuevWC8sxiVhzaqTAne+YGNsrWKxD5nO01v21Yq9+t2O3Ju/VRoR1KdXYA
    U+pSLj3qv5ZtCuWmo1OMXOPF1jpXZf4cZV0HWVzYz174rrwu1OZoPP7BFmXwIkZcam7yRj
    Trwfkt7fWGKlwNIgBXWBVTugFcu+gBLt7ByUQJeonsTQQVAJoRwXtoNqfNN8I+gErAoVJD
    TU3Brk3ZMv7SBVrjfWxRmRw8AeWIWbMjQ0KLPw/8OHYdVISqATjh9ziZKY0ePbmSKSl9st
    uKUix8hXSyf2MaiAEWvzRaL+bnnDco0iUaoHuSA+F4qI1yK9heVVtEiMd567I5kB7UejZ3
    Q8kW2fkLsxkDAEg5HmGLHjAKOO49bsjEjswSxdICZb2obGhlA8M7p5jZx6VLt7trPm/HJR
    HZNV6bhFxgD8gdsSE5YCN7dF2kbtM6RcvmNIVM9xEsm1Jvn1u/bGWUdTQUKc/TF3TYaZt9
    XvudE1PcQuNy6qUVFtu58d2yXT4zoKPGg+c8V1GdWbWfc6dJlWSDjd57umjg
X-ME-Proxy: <xmx:uLz4amnBPloBhwOFP2iRvBmxvS4yktQ4Q8Ex6y-cKSA0gS34JG34CQ>
    <xmx:uLz4alH9v_AMeSeYWOaSMODExN5cS7-gVdODuvSyGzg-IWC4js3_0Q>
    <xmx:uLz4avjogfQ7LHrjDbBzmDKP8NVIcWf6dO_dMMudQI3fbWdlYPDfdQ>
    <xmx:uLz4aqiJqcYt0h9rQoJ1bhnGbomJcTtX26o-LQW7qltlq57mQsESew>
    <xmx:uLz4avaBM3OAlT8u8fqZhCOnBwjRE_oufMpN2dyoW0faoPdtHEpSX7C5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 14:55:36 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sat, 14 Nov 2026 20:55:17 +0100
Subject: [PATCH v2 2/4] media: rcar-isp: ispcore: Update image data flush
 settings
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
Message-Id: <20261114-v4l2-add-nv12-v2-2-a3f5ecfd48d6@ragnatech.se>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
In-Reply-To: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 Yusuke Goda <yusuke.goda.sx@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3856;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=R/pnCzEHugppnU9TrzsNpnjrrTHF1+5jjjcS09z2O24=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+LyxeLo9s7JWimeZAIA2PLzt6/FHsvEBqa+7a
 oC0VxZHShKJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavi8sQAKCRAJtP95BPlN
 JCu0D/93GmR2sAqVOAuKTYpRr1I5c4WN7XAoJm6uy+E7yeo6t0Vojtd5D+UkcaHS4Nsn88uqdm2
 EXifVTy8ggxxIWogzMFcRU0hIh90yrlsJ9kxeURYM4wpXNEEyRyGfrhpZNK8e6Cl//gzgvsTYST
 6iNcvBBSoKJyvO0LBcw7gKpUDpKCpEx828QtoL64uGGnMZpHk1Q8dn6jXzDzS+fOoMxXMHMmIlr
 ZYFzNGb5FortKha3hsIDjRc5e2kiuc3awKIH8MvyEPm4zXszeA/IJYyfNPrrG9oAIp31YmX79ei
 KJZBmogAE0MU4nTCjJ7eExx/bnhuCrKFPp7rO0uFNE0Tp89f0VqMCVQofs7tVBtuRh5KAu2l4li
 XtxJuyEPVP5xlKUgAj9K7ltdhjt9JSeIVweNYZhts7VOxm807s1FEvNo94YK3ctRYorDR3Kt87k
 EaTwS2tCBr0HQR83D+L66gBvSH4VQtob+/UdEt85bGkASaaxMG0V3OxToAhQ9AhAkthq2qJry3c
 dit99jbWnP8KYUypQPGi9+hrF3zsaBCPPh/oxZVFj8qwM2d8VjBGSkzByQ0kaflN7yvIA/3wOe3
 jjkOFFG8/YEDkFKVLt/yWLwEN+ttHLWpy4N83YznyB0qKr7malKZ3ZKRGfECj6MEnGA1K1D3VAU
 mOKfXGEotAVtTdA==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Later versions of the datasheet have an updated chapter on how the image
out flush settings depends on proper stride settings. Update the bytes
per line calculation and flush out settings to match the datasheet
clarification.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Fix spelling of capture.
---
 drivers/media/platform/renesas/rcar-isp/core-io.c | 32 +++++++++++++++++++----
 drivers/media/platform/renesas/rcar-isp/core.c    |  2 +-
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index cc538e984aa1..1c63194f6455 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -727,12 +727,34 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
 	.num_planes = 1,
 	.plane_fmt = {
 		[0] = {
-			.bytesperline = ALIGN(1920 * 4, 256),
-			.sizeimage = ALIGN(1920 * 4, 256) * 1080,
+			.bytesperline = 15872, /* See risp_io_capture_bytesperline() */
+			.sizeimage = 15872 * 1080,
 		},
 	},
 };
 
+static unsigned int risp_io_capture_bytesperline(unsigned int width, unsigned int bpp)
+{
+	/*
+	 * The datasheet specifies strict alignment and padding rules to be able
+	 * to flush out all the pixels. Each line must be 256 byte aligned and
+	 * at the end of the frame at least one extra line of space must be
+	 * available.
+	 *
+	 * As we can't extend the buffer with one extra line we need to work
+	 * with stride setting to satisfy both constraints. Fortunately the
+	 * datasheet gives us a calculation for this.
+	 *
+	 *   FLUSH[pixels] = ALIGN(WIDTH[pixels], 256)
+	 *
+	 *   PADDING[bytes] = ALIGN(BPP[bytes] * WIDTH[pixels], 256) - BPP[bytes] * WIDTH[pixels] + BPP[bytes] * FLUSH[pixels]
+	 */
+	unsigned int data = bpp * width;
+	unsigned int padding = ALIGN(data, 256) - data + bpp * ALIGN(width, 256);
+
+	return ALIGN(data + padding, 256);
+}
+
 static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 				       struct v4l2_pix_format_mplane *pix)
 {
@@ -749,16 +771,16 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 	case V4L2_PIX_FMT_NV16M:
 		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 		pix->num_planes = 2;
-		pix->plane_fmt[0].bytesperline = ALIGN(pix->width, 256);
+		pix->plane_fmt[0].bytesperline = risp_io_capture_bytesperline(pix->width, 1);
 		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
-		pix->plane_fmt[1].bytesperline = ALIGN(pix->width, 256);
+		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
 		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height;
 		break;
 	default:
 		pix->pixelformat = V4L2_PIX_FMT_XBGR32;
 		pix->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 		pix->num_planes = 1;
-		pix->plane_fmt[0].bytesperline = ALIGN(pix->width * 4, 256);
+		pix->plane_fmt[0].bytesperline = risp_io_capture_bytesperline(pix->width, 4);
 		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
 		break;
 	}
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa..8908496c734e 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -398,7 +398,7 @@ static int risp_core_config_output(struct rcar_isp_core *core,
 
 	/* Set image out flush EOF. */
 	risp_core_write(core, ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(index),
-			pix->plane_fmt[0].bytesperline <<
+			ALIGN(pix->width, 256) <<
 			ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT);
 
 	/* Enable DMA and set burst length. */

-- 
2.55.0

