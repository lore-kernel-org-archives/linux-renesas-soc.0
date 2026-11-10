Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276507;
	b=5Pc8HGC70WWL2nm9mYzzZtmM3ysqtIx8yFZc9xYlxnoyUo/yhNojwu3lYJ9Nof7VNMLc
	 eZKXor9RRgYbXfb88KEHaF6M3YKsHSLoZisi/jG6AMMLQetBV1yqf4l9vOUr/NB0vkDhc
	 UAhMdr+bj8Glmh3mY7RwnbGBoaIz4hPOyL1AIBLOr2YseF04xRcAoozaiAOwGQMWwuRDP
	 72iAFfSrz8gfIqwb0PrQgFviUSqrnAsiGY/Ln+kTJEMpmVKhXkNjbZSJcqneq1rVtU2AO
	 bo0hMg0Xln5gwVCGTozZx4fnQLAKG+n5CZ2SBmnscxMIK9agIsd517W/1becDoJLDNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
	b=rUkP+8aeOdrHHHxlT0qpzIIfOm/M6GFuY6hVM6PRqVzeh1zKIxORHkqdpvSxnwec2B2S
	 r9nR5lDff5JhgC7pyz3tU1IDQEyLQQQrUQTzc4RFq2FoV132q83YgTWW4a2iv6jO4rjeH
	 JlyGB0qagjjOPM3JUGWXR6CAH/5T/ZC3mveodPIfR7DEgR6bfQVO12n8D3FblsYxfRz1G
	 TgY9m1SDy5PjE37gUvIod6vVyBbxu1OrSI4oVaGPEVvHTl94Zp5TlbE+NiguOwtxVOKRL
	 zRW3tC3f7j/Zo82toffmMl23M49zdrhvpwzjixmKPLnGVBoRmVnzwG+pX/Wo8V4/xqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g37a4kR2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A250606A321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A250606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g37a4kR2
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d581da0aaso157672066b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 18:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276506; cv=none;
        d=google.com; s=arc-20260327;
        b=imRko93lYNEwjEbOsxM5D7vibRPdBotsRuULpkpeXkd60SJXhckZxoYxriu0V1O/7u
         j7l12B5RBhvGHWytuEsZzxSBAV3MWahrVoGE9MoIiPe2ImUybE4e32skBgCY3SO1KI58
         rzDXnQIWVjODivOrNl1IZUHfq3tf5+Okovn9i70h3CnqOLDCOreUFol1CJAo+Jo4Sy0A
         qPOt1P3pGq0TsK0ZDA9XJGcwmrujs4H2sL8I3zkggmzTN3OInJkgoh2sCJ6bvhDTlyJK
         3v8TWtOcRiiiRMu+E1a+byM8S+GKTFuvlfg4OxtpIeFgDQLjkW74FgnBmmU/6M9jzJwK
         2sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        fh=0CQMBAHM1zRgmPbAA5WvAetVJ0FigXuiWzwV58jmVZ4=;
        b=IxgFU1SMjUUHImCawQ6Q78MJ4i8dZKBL/boZoJlrwoZMSuJHqA061qXFcYYoR/vl8/
         dO7oju5Gnp4oRqDeAqA3NTApRewRba9UtJl0FEjUsoXlJBWoO7VirzCSAFkie9KZ2sAK
         LQ8OUFjVsHju0FxsUqWWhlPkQC6HWC7f/YeJOOqUENepAsX4KOKv3GuV5rx2s23AxQvB
         Dv8qkYU8xdSpoT04ju6+UgUT+UpNUI/YfK2hmd4ZdsKYJNfRDMXe9+6mbWKdmkXeDghr
         Dw0Kd6lROHHc7gGmcKElYpgTfv3MKNf0cPtXTWALm2e+Dm5deLI4wQJ2TLUpbGitEV4i
         SsPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276506; x=1794881306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        b=g37a4kR2OYKgQA6R5gsDZ3w+ZslaVu5nQQYNH6WhIbL8yiCQgzA7D2ZFEzzf/Uyi1L
         ms+IVBX416UN0axrp2IrbT7uQDhVyGpa/n+iK4ZTlddd0PpEBhkuxCh+aUB8O5awVI4e
         V7toYv5zJA5WX2qlPCVlnWyJaefJxlDH6kwtknCChi/fd8EyO7Sb8gHCBeYRtYqp6kdF
         bpad+lD4UgzPg7O88Qdg+nBBBfKX1hZYZKDXPyvt+F02rGBnw0jjmUg8WSQXAlnbJK5D
         +CxeTkQgWXy8raJlGxdWhhSn4XIhjN/sb3JCNZ5ddWfRnMJBbJdpjLK9JvzgTa6qRgy6
         Kl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276506; x=1794881306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        b=fDdnuda2VtoCuaihzl+faNufdTE5FgYrXdCeO/s/sMN80te/FpXQ0UmF/ubWahxvxx
         Q9lV3jN8SKMbfaO8iGxISkq/rvg2nur+WWunS8I/WQVru83XxVT4DOSUSLZLsvtPmO29
         harzmSIDXPN5LNC9bE8FSDydRqC9BRiGiihrcx9bNbuLoVrwsQSurI5vT2qFzEvOvMwt
         hDQXYF3s8q0rUAogRznQQYOz6wpBAwBpSrjdYYnibAxkynJd+APRsY51j2VTr/bhwuyp
         K9rZXrFOMTCCr33BPx3ly2Z7iMk60DyCtF7NZy+HoWrGxp3GwE8+p1C5IR8tC/J6jzZ1
         xETQ==
X-Forwarded-Encrypted: i=1; AL+hErG0TMgXCmGgc0xkm2+8uPcsj501hhKfaUMs53bjMzR0uO45HoeL7QILNt53tueD2o+mCILGiNs4zZziqVk1Jj9wJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z900wfHRXQPq//MW9q+bXafAEMrKF0AhSazVSrOPP/BI3w0bmN+
	1dOfqmheEcKdOxfqyfiUyx32ablXXlyVP2SUDjhiTZUvLvKiQU5ZGikElF12nj8SjtyJMopsFzv
	GtsHnP5wKl0rMK1KliXcy1ncUO3Ykcw==
X-Gm-Gg: AYBFou1Vytay3YzCKJmKLTvJuG17pdCcuH7p/JUVIglKtMtBFPa01/xIaTG3aAeK/iX
	9Nq8ftwkYMxknQyDtv6NOUHzfhNpBSnFt7/HW+60Tx2XB1kDmN82o+RzImHyV99VQpg3zuhmKKD
	HlgqqJD/XHbcRlJNxa3wiFCNBe2O4LGF4WMHG6oNA5BOA3IPezEHNCvEP/3dd0hVxUWTfvFrW2F
	TNwpBo9hlOuZ4v2p3G0YYPGc5MW8Bp6rmpQ28EEzQ+86OZH2FI3MVMINF8bQEImEUtDA4xraMjl
	62QnMERd2/Hwx7QGY426TqQlqQKZhG9I/lC3VFC0Togl2dDuBcn5rQGQtzeGFhOFkErw2C5Hyf5
	cGoSss9AwBnjyygT5/sEpAa/BejTQNDx+JEA7KHDDiT5ouD5LQjNoS8Fr7ZH53MzqGw0H7nhhp4
	4gWg5ZsbDUxmRb5LAWXOwrJ/rN9BXWH7gLTBmx+rvY1C4=
X-Received: by 2002:a17:906:f58d:b0:c41:7e99:c6c2 with SMTP id
 a640c23a62f3a-c5049656cbamr100998466b.44.1794276505640; Mon, 09 Nov 2026
 18:08:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:08:24 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:08:11 -0800
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Mon, 9 Nov 2026 20:07:59 -0600
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
References: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Date: Mon, 9 Nov 2026 18:08:24 -0800
X-Gm-Features: AclHuK9zIcEhLJfPfTc1f-zmgRBrGB7NhIU0-U0vwWpTSSE_uoc-gqIjLG_ZynM
Message-ID: <CAGEsz8G5RuLvQUkfg-H0zArwLrPuoCWEt2tNO+nMssu+w38sMQ@mail.gmail.com>
Subject: [PATCH v4 2/2] media: rcar-isp: distinguish absent cores from probe failures
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

risp_probe() interprets -ENODEV as an absent optional core, but resource
setup also returns it for initialization failures and deferred probing.

Reserve -ENODEV for missing core MMIO or the renesas,vspx property.
Preserve clock/reset errors, defer until the referenced VSPX device
exists, and use -ENXIO for malformed VSPX data or failed RPPX1 creation.
Convert remaining resource -ENODEV errors to -ENXIO so the parent
rejects failed initialization instead of continuing with the channel
selector.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Suggested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Handle resource errors and preserve deferred probing.
- Apply after the IRQ lifetime fix.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c
b/drivers/media/platform/renesas/rcar-isp/core.c
index 14f3c8f..0a32201 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -800,20 +800,20 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,

 	core->clk =3D devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
-		return -ENODEV;
+		return PTR_ERR(core->clk);

 	core->rstc =3D devm_reset_control_get(&pdev->dev, "core");
 	if (IS_ERR(core->rstc))
-		return -ENODEV;
+		return PTR_ERR(core->rstc);

 	of_vspx =3D of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
 	if (!of_vspx)
-		return -ENODEV;
+		return -ENXIO;

 	vspx =3D of_find_device_by_node(of_vspx);
 	of_node_put(of_vspx);
 	if (!vspx)
-		return -ENODEV;
+		return -EPROBE_DEFER;

 	/* Attach to VSP-X */
 	core->vspx.dev =3D &vspx->dev;
@@ -840,7 +840,7 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,
 	clk_disable_unprepare(core->clk);

 	if (!core->rpp) {
-		ret =3D -ENODEV;
+		ret =3D -ENXIO;
 		goto err_put_vspx;
 	}

@@ -860,10 +860,15 @@ int risp_core_probe(struct rcar_isp_core *core,
struct platform_device *pdev,
 	core->csrstc =3D csrstc;
 	core->csbase =3D csbase;

+	/* Keep channel-selector-only configurations working. */
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "core") ||
+	    !of_find_property(pdev->dev.of_node, "renesas,vspx", NULL))
+		return -ENODEV;
+
 	ret =3D risp_core_probe_resources(core, pdev);
 	if (ret) {
 		core->base =3D NULL;
-		return ret;
+		return ret =3D=3D -ENODEV ? -ENXIO : ret;
 	}

 	ret =3D v4l2_device_register(core->dev, &core->v4l2_dev);
