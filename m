Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCF311C2C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889681; cv=none; b=bnMNWMExVc0RkTPeppdXu75IZkzoBCAqNvXBWTpPcx+mIlKMbkASo719T1LbTZeLpt6GY1Y5QTFcVB2sgD+TPDkHEJoUfUY/LNS7FhkKty8tpe7Wgo5HRXtX5e9jxSRXtovMeeYko3i3meTgAJaSzVaS/GNJ6oT4mKKniHj5YVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889681; c=relaxed/simple;
	bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2qe8NNkGRE23C1g+v1e4F5O5ixyOsTgqX9r+JzpMYfzrpQlAR48oaI/do/odrf7R3VHe07Tgi+tWB9KGPt+IdOzSg5MAPj1ILPrS6Jn9lV3lhQ3zw0nDDI4TzG2oFPiQyTQRmf+brPUYenhxqTuzS5LEaok/5dzdVpGOLvj534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MzT5wCe+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ChXgMB2Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MzT5wCe+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChXgMB2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
	b=MzT5wCe+Hus1kPAmRgM64zGgCOTdvGW/yIZ6p1ha6womBTyEaS6lqkc734iu0oQ1FPWZje
	opdK3KFsHnWDJu4fK4ca/jy/OVslcl95bZUKpmsZhSVmx3CsnBY7m7t28OsV8w1dtr1K51
	EdROJuOJGa11WdTxeYEauKXq/8vRnQ4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-AtBiX19BMdi8QJpddImivQ-1; Tue, 08 Sep 2026 13:47:55 -0400
X-MC-Unique: AtBiX19BMdi8QJpddImivQ-1
X-Mimecast-MFC-AGG-ID: AtBiX19BMdi8QJpddImivQ_1788889675
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so75090986d6.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889675; x=1789494475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=ChXgMB2YZXHnN6N1tz8Qf0WEJoLmxyOkgYIAmXyzq9kwLiKUHYyLPny9Y6gFQbro/f
         KehRMzY+0O2hhLBRJDtJi/Wt1qcOXEp6YGEbyeT4nQFHXkzT/E8V8PQ0iQ3yQCBJ6cff
         +SzkYi8VYV2SGAiEipz12pTNumKC9DRS8PhcDoXPFtlHuWi2qPoqG2yE4roIfO8lTakh
         Y3q5NjUsok8/DW99tgDjl2JAP3Qre68WJN8bNS7ZKHkOTpCxv+wkN5sF3HaTBa2+8ikl
         pXkrmQIjCGJu1e4g7FEW8MXQqLG1ycJCsm4SokVtw/r4jIT7uR/ejDHUIJlSM8H9S8Ya
         tpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889675; x=1789494475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmkVIyJpnqsnRkQ/AN9eH6zCUWkahngJ6micUwzJvZg=;
        b=ru8aqSY02dNnsG6u7E+gQ4p+BSORzZUyZ/8CQ0DymLylSLAMraVFW+XH6dMXWFqx8d
         O7Z9Zx4MZPb/O3QvCCWAiZwtHI89ahIemrcpwY1inue87qDZziQa+l7rJYhj+4TO6zVt
         CCzuqJrnr6xo352SHEvFz0Ia/MmqYJi3Q1EVPKK4EUk96EE/7VeHr4YBPaN2xK1B7oSC
         tJjdztk+IKnbfHxFxAP/oys/q/h0RRw4f7FqFfsFR9Q8vZx3UzJfioFp2coyjL+FyPyi
         BkD2NLdhcCrkc3e1AczqE4vPkaYJQEV7etmqlbgZUiUs+WNvwMold03aN9iD27WnICVP
         qHZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5TAOsxjbUTkhXqiFW/zWcDVSgnvawW3xbHlSMRamxlMuX6diZFfH3g+K7FIxwP15tbyOPemRKbj92YeVA4JIlQQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nv63afubCWCWTolmUpIsbCBdbFaaiwXMhYaD3XcdVW7eJGZudU
	jxbRLzvM5hsYtLP5yWyX9v92zQWWxSCQpPBpkapYO8Vlk0Nz/OVTM/hf2G02PRQlVuFKpP4ZnLi
	oEwZGpZMS5A13ZqrS/6MC/SO2MdnCH9ixCghco4kp8iQi5x/KMTu1QeavxIogfXe0iZJ+QM/f
X-Gm-Gg: AYBFou23zEq95Q42QW+xV1Jl/Ty1Fl7//vszv5iT8G3kbnI28gDaBEDCbpg86uOx9xR
	qz5VVaAVh7xu8uPRXagCf1ZBboL+bVuDLQkQOtR5chmIwH9jW4ca97rlzX7Dh5X947FF2eW97H0
	ecSGMXUgqWr2hdgZnL0aH2B5IxvLeJCECyo9ax03US2YYpHe303y6ZaQg41iSCyVtHAqTz4CgdL
	TS+u+D2yl4x+NxAjsgSBXS/giwN03b33EI1efkZTcsrAiEe/68k+3qDElCyjCRLaUnLKQuh2veI
	cJG9n3G1lkMuAWYYMLmiLVpvBPcGKj8sOiHg1KogZgoPsPfZPQcuRyX7P8gEiVw4wJZpR7OXFFq
	cnTV3jsWdGD0Lou95IUXxt5Hw+Ri9aTIH2nf6TmY=
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213723785a.21.1788889672141;
        Tue, 08 Sep 2026 10:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr3213671985a.21.1788889666833;
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:18 -0400
Subject: [PATCH 1/4] driver: core: add subsys_driver() macro
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=a7E1cAnanYVVkRWaKkPGdq4ia4gYC62syLjr8jr85LY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNn2tBU1Ni1/dSggNbqg+dfChvjbuQt/uU6Q59qeu
 buBSUCwo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlUcTMynEjas5VdRKHyXNSp
 jwynb6XoznuXmfJN85R/9wbxuKPTTjAyzIwrYIzpUotZnHuvkkEkgW9DRFtASu7/n+a/65dJC07
 nBQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new macro subsys_driver() to eliminate some boilerplate code in
drivers that need to register earlier in the boot at the subsys_initcall
level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/device/driver.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 768a1334c0a1..29fbc01ef06f 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
 } \
 device_initcall(__driver##_init);
 
+/**
+ * subsys_driver() - Helper macro for drivers that don't do anything special
+ * in init/exit but have to register earlier, at subsys_initcall level, when
+ * built in. This eliminates a lot of boilerplate. Each driver may only use
+ * this macro once, and calling it replaces the init/exit boilerplate.
+ *
+ * @__driver: driver name
+ * @__register: register function for this driver type
+ * @__unregister: unregister function for this driver type
+ * @...: Additional arguments to be passed to __register and __unregister.
+ *
+ * This is meant to be a direct parallel of module_driver() above, but with
+ * the init call promoted to subsys_initcall() for built-in drivers so they
+ * are available earlier during boot. When built as a module subsys_initcall()
+ * collapses to module_init() and the normal module init/exit paths are used.
+ *
+ * Use this macro to construct bus specific macros for registering drivers,
+ * and do not use it on its own.
+ */
+#define subsys_driver(__driver, __register, __unregister, ...) \
+static int __init __driver##_init(void) \
+{ \
+	return __register(&(__driver), ##__VA_ARGS__); \
+} \
+subsys_initcall(__driver##_init) \
+static void __exit __driver##_exit(void) \
+{ \
+	__unregister(&(__driver), ##__VA_ARGS__); \
+} \
+module_exit(__driver##_exit)
+
 #endif	/* _DEVICE_DRIVER_H_ */

-- 
2.55.0

