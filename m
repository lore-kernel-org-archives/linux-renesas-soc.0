Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262123;
	b=1fDZm6W8sS0mWXfVA5R1TakBbcXod1bxr+ZjB8LYqCBcha8kkDgS6O7gYnGka1VBBbHf
	 k4gwhUueMwHK6fU1TrtKsZY3C3SDgVUaVWQvvHAF2jDKSWy69Ia0b1Bbje8hCmHHbpCzt
	 RjU8nhWuBEzQYyaJ5A54hJL4m7b+vvo4Pt3j8ExOVf0hJKdE0jb8OnTfNC3/JX+Hj3HAs
	 HzkK2M12FgG5v6ZOpHaan34K9tCqluo7u04+X6r0IW3MNGhGpSDkA3Guj1bnz85hJfNVt
	 hk0Mh8wJf8imSaGAx5WIBuvZwj9Wo52b2PfQxWkB/o95iRn7eXE1+RxF3/b5kP8Bv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262123;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dVICqIJ5zW3htHU6bK76kpvRAK5XFcaQeHCRH3i7ebE=;
	b=cbY+NdsLjM+1OjhEN02iI3mqfuoI4W/8e/StqKP56VI3jy6wydgsPUzslB890cg+r4qT
	 OA0VA9IM5s3cKkRyxLkhLWOMfxaaqbSXZbUBOZlf8Mv/SwQLgC0saD1svn7uE5AMuMogb
	 dR4rnigrkL8ZN4p7+zbAq3KrpoFNxIWNoJJtXCJHrOQy968M5qrmRZNSl5dl1+XuGuBqq
	 2E7zFv2q4dc1+j9HCjs0tF+MDspMuO9qb5A6UePrnFE2wLfmWMrtOqGT9NYjCmbZ0NsR5
	 rMpN/r8aej2vBQFcWaH7y9Du9Ha3DQ/kWL7ZNxNQQKc3RYS0im9sBUBccV5vGQqp7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=tRGhujpv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RLYk5YWP;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46306606A320
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 11:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46306606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=tRGhujpv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RLYk5YWP
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 18394EC0AC6
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Nov 2026 06:55:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 21 Nov 2026 06:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1795262121; x=1795348521; bh=dV
	ICqIJ5zW3htHU6bK76kpvRAK5XFcaQeHCRH3i7ebE=; b=tRGhujpvQvIP5foq1K
	b74ljqwV2nta3YSI2v+L01tAAmw1JKm4lxyEv072pT7hwqbB6r5PscshIhhRVubx
	7CDP+Q/WmhYRhGizr4FcP2L4Vd3tmQI9SJLORfAp0MHae5GU97Ddcjjm0kH7rfQo
	y+jUwwLRMpx3Odf8E39keppfz+zO2pdwgSFRTripJNOxiw4BN5yf3O73HJ9HFEIX
	EcfYRngN+tcVtvyyqkj/jSx8M9puCObZ6EtmN05aB6xlqBQiHwIRykTXhoZEYT2S
	0b8xFaLhoVOrlz0XaMoMxlKgcZoMTZ6jh0WUkeeTveXIqTkPMTHfRSPTEp5LvngQ
	2sAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795262121; x=1795348521; bh=dVICqIJ5zW3htHU6bK76kpvRAK5X
	FcaQeHCRH3i7ebE=; b=RLYk5YWPqdO7TBm0japvS+ficlihwTSgbshKvETG01gI
	ZrbkgrZqeMgqlQ7hfiCW1+xm4h3L9y/UKR0ayzqTU6FDjV+/jN4lw0BrIvTISw3a
	kYTewDmNB3N2AuvxSx4oBnXxk04QIV7aNWBpwP9/EzxsrildMX6ttxRgLM8P3F17
	IcRmK+tLL5nRD3zzuolT8RuN6/8ayUw64B9p0I0BOzAaLJCldc39YSJJLj7PjdAQ
	xFichONXPLSPCJO031N5jwFNyoPEbsu9uyHm7m7qdRCu0FZZ2wy7p2XIw6ydlFC2
	7aEa03JJtCOjAFfensBrG7Ga/8KB53tKru/rdYv7OA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795262121; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:K/FQ03xs8f44anFt1E8+6ADRA/HIbd0SarcvybegO6UPrAl
	T3tA4wxgn3Ugbvd7urivbPGWNpByvWpnVDEopjSu4IufkqOw3Tiihtbt22IRSn+L
	EIBuPR2IZ1bILc47uYasy35x2LWp98X9uhMzb64dIXVqnkXn41Ou0X21JWkSjJoD
	NVtPwnwyRTtj8h+DXgCmVMaHfHeghlikEs/GL/3ztPsbp9jJnrG5wnl+TSyF9rdJ
	rYlFqF489i4nxedZnQwdZS0W4HcnY4plHxSr4Hbo6xbg0cm140U/gI7ubjJtjFo0
	aHw4PVBJby8RzkhdErsg+L/SKZUXmvhkvMzW4Dw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:k75Lbqr2aptnmP7uvf/rvhh3qgUcTsN/Zc3kWBC6fwU=:8x0hF+wkjYDw5ltkamw4MuqQUv0aAsAeETkZeQggL08=;
X-ME-Sender: <xms:qIYBaxcRgE8pyUBNEv-Bs3kJP4xNCSRiBp-IEmZVh3lPnIrmqjaTxw>
    <xme:qIYBa_qmt61fr4xv9qUNJEGur_vvFveeGjPoApMdCRq93Ccr7YH2ocK_KEJaBrxVU
    8niQylDywgaS3NcPFrB1TixBMHWz5WfOR3puZTaclbpIBBPp_BVSaoM>
X-ME-Received: <xmr:qIYBa7OwtXpIXQQFGaVoUTa9XZkfseH24jVzNGd2D9XeNUjOTksLu8ZGvoScAtvx4ZuNNkj1v4f3tLx6FWN-tl9J8LaFkBw>
X-ME-Proxy-Cause: dmFkZTEKe1GzsAlymTs/w9XW2L2vFYNarLnQj5xO2bQE+sZGJy3roUZsHHtT3VjtiT45ZG
    Yj5b4wQoN25GgfnB9UfAXaRa4+Fl8TPJpF7i2IKUwwmdIE5CnaOemfLBTtsJO2VeKO/Kr8
    5X62fLGt2FQeaMPIUs99VQWaO7sa884Eedv4gQkxyfV/Dcc33IXZ7mxOocw5IdGZKQsjSi
    09Jhaa8TvmjxUQu0S1QFqHkuxyGjFx5d9ojfKBm3VBioxi70bBzMduDQ8awe11DifVXrOQ
    O6dnm/sAaczRwshrc2h2m6/KDI1MzqVwe9ccZ6BrvI2er3rL77VwoOEHaz+GZRRaM2oqpn
    lRKjzFOY6vL31oFABitet7AY2tGv+jobdCDckK303PXJRgISjW4cryEE0JG6vBkmOKUVBA
    1r01kIK4Lyyyit+E9MCjtOMlRORMiypgD67xx3UKST2KEIne8QCPHxI71u/bh3ipHW3rbt
    5Bk/UV4vurpFaLJPk/M8u/okDxy5y/ecaUy0mV7uBdONOgJJSVwkgEsVEIg9Z55CtcUq1Y
    DsbDezuyIc87QWR7jtgFsDCEOCr0Un7kOWFktLAIhEymMR9vB00i/XhHB4XNC1DW7rorRz
    0k/2nkBbYvRGbpTeR8IY9LeE269DlIWaIYPiNr/EqKtQBC+W6LEwEGn33hdg
X-ME-Proxy: <xmx:qIYBayj17BI-hHXLPDXN3CalRjbwMAZ5MxDZM37YSFlbsPh1eR1Epw>
    <xmx:qIYBa-uKrBdnqFl3waiEiAQ5MCl8hSMDgWj43m2JIxC08o4fe6fifw>
    <xmx:qIYBa2hJXyTe3CyW5EntHdBPhxpOG1Du1x-Rka6hcCA3goNa5m6zHQ>
    <xmx:qIYBa0aJg1AvT_b33Kxy7G6WrpM9IYXIIP0hTnJN9FBIJijnyZKIGA>
    <xmx:qYYBa1FgUwWUIPiJQYr43a7jHMoZDO1DLgIEZrRDOQOZ2ZXnWLzcdsNo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Nov 2026 06:55:20 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sat, 21 Nov 2026 12:54:59 +0100
Subject: [PATCH v2] media: rcar-vin: Return unused buffers correctly
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
Message-Id: <20261121-vin-fix-vb2-v2-1-602a3d876853@ragnatech.se>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TV0g1A88R+GQ1sXWA/FtNhoC
 P9uwavHl5l5s0LkIBzhWqwQOEmU2WegUwFuMn5klHtmoJLqUpPGJB4HeWOyhKRZWUuVqZWGvHg
 GztFhu/U/ji/7YLfsir0xSVzm8Dnuktp7/81JocK2YauGamguru2CGb1Z2E3nyNBv2/YFRdYQ1
 LsAAAA=
X-Change-ID: 20260828-vin-fix-vb2-28e1bb24a618
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=8x0hF+wkjYDw5ltkamw4MuqQUv0aAsAeETkZeQggL08=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBrAYafR4cljYFsvw9CBk9hPyZGDeQEinQPTtzYf
 0KFRZACqdSJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCawGGnwAKCRAJtP95BPlN
 JGyKD/9w7UomngTaGPHnXNxVPV9gxFnNchUp2UBiurm/5FfDIg+rMhVuye8T6me+fJ8ZcuTyJFV
 RlT+bNzsp+QjmUQ0nGZ1NCM+igiqxq9yGmrFTauYrexPUrU6R1NnNhVtwwdZ1pW+NE4dEuNtRhW
 MztvKqH5MgfSN1wvWPXrJGrFILnc/AaUNSxbFj+H8rM4PpRZhzk9Rq3y5yqHC0qlnXOEgxVYION
 ephQwXq7fu1OBo0QmW/+0y2rGBmAt9/kqJvUHqJ0jak1kcM0IpGZgJFyxAo/9IkWMXECmH1nOkj
 T6ICqJW1uEBo99kArfqat8qQVfZYSVZEb/GUTeqbrUV6DHC8fDBL3heRNv47ieo7UF2Iap6reci
 gJMehHmMQ8eWNjP8ZNwYcs+Xg3nBSBjN95wCj4JIXh2swyaQd95V3Qi95VOSI1RaPnMR62fqC1q
 1l93hGozHRUiOhTSNowRzohYvBg8YMGc3S82FzPb+sskb8pBDbni2FAQVA7by6V+U6NTug4QRUD
 BO+0s9ndYosn7YgTjz6uMR2pGbKlxU4PElSzCKgLgWokCcbbcE6PiUQlbJKWerKO+Xpwu7Kr7Z6
 HW2o7ou/sFWwrxv/+Q87YIOEOgnnK7L/E4bJPPKEqR29XoteobI+B3VGY+O4kL114nArEb1mY6h
 iotuSRgvk9J6L1g==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Unused VB2 buffers should be returned with state DONE not ERROR when
stopping.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes in v2:
- Link to v1: https://patch.msgid.link/20260828-vin-fix-vb2-v1-1-97eb1f4f75c9@ragnatech.se
---
* Changes since v1
- Fix unused buffers returned in rvin_stop_streaming() too.
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 5e515d16c164..d3d1af47f8b1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1434,7 +1434,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
 		if (vin->buf_hw[i].buffer)
 			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
-					VB2_BUF_STATE_ERROR);
+					VB2_BUF_STATE_DONE);
 	}
 
 }
@@ -1449,7 +1449,7 @@ static void rvin_stop_streaming_vq(struct vb2_queue *vq)
 	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
 			  vin->scratch_phys);
 
-	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
+	return_unused_buffers(vin, VB2_BUF_STATE_DONE);
 }
 
 static const struct vb2_ops rvin_qops = {

---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20260828-vin-fix-vb2-28e1bb24a618

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

