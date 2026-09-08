Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4C598BE7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889674; cv=none; b=OirAB+uANTEG99MHJLYgn3b0yLlxR9glJRWv7CMBwb+tGMei/K+aj8CdN4705G/FGvrZ91HUPc9mdoV64WP71oHIg7Itx/i6EYoOK1ZIORljgUYk23rc4fGi5nmZCzQ4RAxAvr4GWGT6W/1EDhmDokUL9AFSXb6l8oAlSlrVZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889674; c=relaxed/simple;
	bh=dUQc7PWrbX8uAQtdC+UYHtMhjF0PHNUBZJYOmbunHLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzUYBg9NBSM5/MOk5+vbvyEzcfl4ZLPFNstXiXJ9UDmUNwpopSh1pkTOdN01AAUQxb395mDaM1a4czj8nmv7Zht2hqaQbtj1gd2s5RYhKgzZzMqKeYirgw0htyknPQA1bI4HLnRULCNos9aeA2VeO+dz8WypaCZyeLkPklhXIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7i/U2SY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pNmM6S+l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7i/U2SY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pNmM6S+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
	b=X7i/U2SYCXRdmyV/ZuKYPFzyDffRGeeLCbXTbOTeHu0w4FZ76eknLt54TfdyY1827Rmcz3
	2JvyyFEQKbMqfflKxTUndFZ2mslxIyHbWXpZcWppU1rqMdErvkQzgNo1/uiTfZABf/DXvU
	FXk26fQt7sKo7dsmfspmi9Ibd34sF7c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-fWK8WLTjM0eCAYmXvdeXvQ-1; Tue, 08 Sep 2026 13:47:49 -0400
X-MC-Unique: fWK8WLTjM0eCAYmXvdeXvQ-1
X-Mimecast-MFC-AGG-ID: fWK8WLTjM0eCAYmXvdeXvQ_1788889669
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so1130461485a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889669; x=1789494469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
        b=pNmM6S+lWnzLOabIrfOUDsGtHlLfzHedNz672OW8oiBuGCXzqVaXDCSNLjZ353pKZU
         HT3Pg+zrDq+dvJ73Z+139DuHt8Hkctv59Z8tCIaTtEps/kvG/fDrt3xEosHok2gylxM4
         aQBhuWlYkgGuYKIx1eyRZKfhobbJrE3TVWBGVTbHpC7Ka+ATN6+GsepPLG+PbiOTMKT9
         XtsaoFXy3OM5CaBcrNGw252Pmn5Fj/ITc4X4qxVFrOL6zsHxthSEeZK/bjeZVf4MBv/2
         7JA96V6McoL7ysc5bmQ7uJqZ30Ze/xUGYPsdu3+s08GEKDY8m45VWh3btVqlqQQKjWlN
         sEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889669; x=1789494469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
        b=B3JYYpXfyse/yqsG4DrMSF60SKPypw03Zo2sFkLOlhIGUA+FycLCojBP7MbsdxDVtC
         zionU4PZ4U34yx0HF4o3NETmOntsLQyJFjBuIyNOKXCJNTf4pxGRYWQ0irCKVJ22vM6I
         yEF7bZS5wtyVcoF3aPM/fTz7xeZKiAQPHdfX45bwiZKtTW9Bh+KKYZHQP5PpiMSWqtaX
         s2s76JnQKYu1Fkdw9N3caFM9WaATdi7IqXzBY14Zu8PNlgk6QDdD5hWMXbyKExOZ4mHO
         9zhPZqIsFTkuOb07b5i+L4gSHm2djtmEpPQGev3ROoj00Ov+njk1dNNZ85P4FGT1i/Fo
         BUxw==
X-Forwarded-Encrypted: i=1; AKwUvByIxTjkA9ySzpg3eRG+Q5WkYyV6VqjfpIG1T97B2UpopHLlAubk41xFhHnIzCCacDTcT9kuGGUwS9DpVY7ppf5hWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nw3XD9lgniGKrdb2pEDkVnkwmY+J/Z1yN0sLZ/EwcwHZA4r7On
	c+rRgsrPrpfFpVEi2krzVhkapGHZYOXg6skIE5qTIUImF/bR5U133VbwFQ5iDnu5JBvfutXbTe0
	SjleIsTjZP+1oDXyFKrwJqEMyTjvgk4tNZkrcWu1ryw0utUyl1zOz2wOk1wnB7hwkSgSOG5ll
X-Gm-Gg: AYBFou37nreMr+BetBUU0KgOdcEx0bRMYlb1EtbMHsyxDosdqdvMOctDD8xZCdrWsyg
	ind78cugnDc88RMQ7VEp8gWGiuUAr9w/Vn+/5iGPucDI+cFoQlWMS5ktVqGRNeuFMdPxCajo9ov
	JIElZ2GPCl1QlOOz94G8jilSJBXIFiF+FE1iGcm8J6NYc1a/HTQkrlMwD/51r9npY22da7DlSz5
	rcYARAHCo1WsND+XLijQhhcr36502GzFCFGouP6iGdF18TNsdUPweQZCTvNYXPSX3dJoRpQn3Nj
	KPZWfcu4ifk1ijgDzqHvNs1xFgecDIg+9uhOjYSJVulR+4EbZgWMWiYwJXCJ1oG6/i6lNmECLOl
	kueyZ7tZ66U8cgyjb0R80QDJSfcGqLe+H+/oYCsE=
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr3211077485a.50.1788889669057;
        Tue, 08 Sep 2026 10:47:49 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr3211071485a.50.1788889668513;
        Tue, 08 Sep 2026 10:47:48 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:19 -0400
Subject: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dUQc7PWrbX8uAQtdC+UYHtMhjF0PHNUBZJYOmbunHLw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNlGl8x1q7io6bY7/Mr1m+sOs8htXTHDgn3Xkynhp
 n13mGK3dJSwMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARrxWMDNOmXTSv84h+H5Nc
 x6l2bu1a9Z2zF+xt8P8V/vrSApf3xw8xfPd1q/34Y86hFX6zHQTmaxTZqMWemJR+mlll0c+Ol8e
 FWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new macro subsys_platform_driver() to eliminate some boilerplate
code in drivers that need to register earlier in the boot at the
subsys_initcall level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/platform_device.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 3d5bbcbae730..3bd0f1f0d870 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -344,6 +344,19 @@ static inline void platform_set_drvdata(struct platform_device *pdev,
 #define builtin_platform_driver(__platform_driver) \
 	builtin_driver(__platform_driver, platform_driver_register)
 
+/*
+ * subsys_platform_driver() - Helper macro for drivers that don't do anything
+ * special in module init/exit but need to register earlier, at
+ * subsys_initcall level, when built in.  This eliminates a lot of
+ * boilerplate.  Each driver may only use this macro once, and calling it
+ * replaces module_init() and module_exit().  This is meant to be a parallel
+ * of module_platform_driver() above, but with the init call promoted to
+ * subsys_initcall() so built-in providers are available earlier during boot.
+ */
+#define subsys_platform_driver(__platform_driver) \
+	subsys_driver(__platform_driver, platform_driver_register, \
+			platform_driver_unregister)
+
 /* module_platform_driver_probe() - Helper macro for drivers that don't do
  * anything special in module init/exit.  This eliminates a lot of
  * boilerplate.  Each module may only use this macro once, and
@@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
 } \
 device_initcall(__platform_driver##_init); \
 
+/*
+ * subsys_platform_driver_probe() - Helper macro for drivers that don't do
+ * anything special in device init and have no exit, but need to register
+ * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
+ * driver may only use this macro once, and using it replaces subsys_initcall.
+ * This is meant to be a parallel of builtin_platform_driver_probe above, but
+ * with the init call promoted to subsys_initcall so the provider is available
+ * earlier during boot.
+ */
+#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
+static int __init __platform_driver##_init(void) \
+{ \
+	return platform_driver_probe(&(__platform_driver), \
+				     __platform_probe);    \
+} \
+subsys_initcall(__platform_driver##_init) \
+
 #define platform_create_bundle(driver, probe, res, n_res, data, size) \
 	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
 extern struct platform_device *__platform_create_bundle(

-- 
2.55.0

