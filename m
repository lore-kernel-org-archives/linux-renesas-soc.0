Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8871259D613
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889681; cv=none; b=O2yijz2PnDbcSazego+RV1yGVtE4wP/8sbp94IoliJlIbCtzh3YuPlYrWCt0SjAet0GCzebei5JbmANjdnJZ7lcHLr/A70YGPJ1NuJ932g+Pv5/x8M2lwCR9ecePKbu393ef3Kg8/z5b+/QWnJSKbmPoHx9mdEoMrqJkeS3cSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889681; c=relaxed/simple;
	bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QB3vuW+VOHL6YHilKvOyVc5ixO7gI27ZH76d/1ZxQzPCg7MmD5tJ1XVa09tulOjL03ut/VrskLDz1PkIT7NaAR2fUIpzhzHhZGU896NHXUtNW+AkGupwitVBvwhrwnEnXyAvRVifumpyoK7pYcJtu+3KWJ8m4es+BPBqXs/Oqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JrmMWXmG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PsOn/9mS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JrmMWXmG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PsOn/9mS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
	b=JrmMWXmGfR2fy4qjis4XVi/zIuDmH49I6rFnsW45L5CZLho846cHhiAsM6P5ne3X1nPEPf
	w4JL9oMBvWisubk4bdg9fHerFPOs3v2n/Q9me+X+oLZN8HsEXE1z9RG6CjyjEidYShhZWB
	oOOqM/la8W2ACafXIXooCezOPvFDB50=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-SSta4qaiO9OLSd2057Ox-w-1; Tue, 08 Sep 2026 13:47:56 -0400
X-MC-Unique: SSta4qaiO9OLSd2057Ox-w-1
X-Mimecast-MFC-AGG-ID: SSta4qaiO9OLSd2057Ox-w_1788889676
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so487709285a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889676; x=1789494476; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=PsOn/9mSRxlVWjIWLDniDeVMz0sm+1ZHIcbmye01oT4e1WV5h+NNu89OnBmrWvSnak
         plD1HsG0hPSPozf7p5wIViP6upggzAMFum5VB1fv8B4TokG0zTZCcP6XWch+w8LcjYOe
         x+Ub0pylTlpCghBzdBQvtR8OZwNVsNvpyTtBpN+HI/Tg5TIpXIl0x5TfIZHv8iAIz9uG
         3nfM7g57WD4VKtjaSvEZuqUdLyatHJcKNGtrnErbYJxKUWAwRwURcESgUai5iGinatNb
         6PVXSnOtCrQO1fdPHhRrIXbB8xv7KTia11ueFtadstrXQnY1aD91aALv5jOL/bj9WeOT
         vFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889676; x=1789494476;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=BHCOuw9KlXKRGgq9w4H4gG6PipD49fkoslH8a+Yfkz/WxLtRh9naZ1a9oJVwBUnCJx
         K2mGbaUFHED+QfURt3prrOEMUOARknUMgEM/Pc+9kr1MNCijNrlM/s2y9EUFvsfJQq66
         QYjGD3JJHjwSXlEMytFD+TAevs18j651bvjOuWf2eRWJsDFQxLod4ZcLLFRU5UtQTUHN
         cjROydRNyIW9ThygsEeR1zZHYo3nJe4xisZcmH0nzy+9oQY1IiIrDfKVTORpTl/Gy7dF
         QoZQ5JS4xMQrFkhZCswURlPObOR95SAWb2F5VDA4f6IaL8nGjolAyhQLud7XYaytSx6+
         hHWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOp0PYgtDc5mS4j6sbpLRMMrj3uSbjXtXHDy1zcsS2Vo4gdRW+0M2VRv6OWDag8f3PHArjRXc+DT14CvkKfeyebw==@vger.kernel.org
X-Gm-Message-State: AFuF++l00EPxiKXYtxFV13hrzmyKP3Y7+xqVYQnyiO8tj24Sg98kpMWz
	Vt6sd+AT8kX7QxLcckX6M1EMAmPDGjpCv1rJFNxKg6C766OHHPxsX+B8pJYfyPCAi5DOyLvkBq2
	YSPAgHcsMbAdx6bcixQUtO9rcBksl+sA4UjId9Z/HYh3z2uEKUnlS4yfypTQSrQwQqandNkwm
X-Gm-Gg: AYBFou1iVO18kLp5pVh82vbGkYLAYooJ4C8p0mOFryZuAnYnNasQ9HUOezl6svxXUx/
	7p1n8qaD88VGqSTv9ERYzhNe0VMMEtE9eN02zhqB00QMbuPBaJfhNYVO9xa8D0yg14Sb9s0Na0c
	ClmXGITv+sYc+QACbPuYtriDd89NMwuBd75i90w6UBd9M1E54Z/Qq/natHdr+StSzTsbwfxBAW0
	wUzr1daCT6jqKi2HypVhc0x24MfRg3v+HpjPGKWTJbJrcDpD7rcsApl+bLWId8G0MC5XKMo/LNQ
	PcbW9jGBvTecnodfMXfnq54s9zV4uVyeW2EA+PBjkmuF1p/hkh+kpxweCOEQknBKLH6sr6xGPNu
	VVNllqWzQQt02dXf6DqLxQvdMOk1tf65CzbxKtHM=
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317502285a.32.1788889670785;
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317454985a.32.1788889665304;
        Tue, 08 Sep 2026 10:47:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
Date: Tue, 08 Sep 2026 13:47:17 -0400
Message-Id: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwML3eLSpOLK4vjMvMyS5MScHF0D05S0FNO0JIM0AxMloK6CotS0zAq
 widGxED5QS1ZqcgnIGKXaWgApYv2WcwAAAA==
X-Change-ID: 20260908-subsys_initcall-05dfd5fb0f04
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeJmuupF5qfh/577Yn+n6AlwhRTy8z9+nMK7UN53dY
 njB8hdTRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5y8DwV+bCmc9hUzsWllQ3
 T0866pnk3+b3w9Wt4l5L02+uoEu3rjAyzC//cKIqLmHOvw/rd5y/xuD2JExGfTFbQpY2n87nG8c
 fcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are a fair number of clk drivers that are registered at the
subsys_initcall level since some clk drivers need to be initialized
early for other drivers. Let's add a new macro
subsys_platform_driver() similar module_platform_driver() to eliminate
some boilerplate code in the drivers.

This series converts the Qualcomm and Renesas clk drivers to show the
code savings that can be achieved. Once this lands, I'll convert the
remaining clk drivers this development cycle if all of this can go
through the clk tree.

Outside of drivers/clk, there are 364 drivers that use subsys_initcall
and I am willing to convert those as well starting the next development
cycle once this lands in Linus's tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      driver: core: add subsys_driver() macro
      driver: core: platform: add subsys_platform_driver() macro
      clk: qcom: convert drivers over to use subsys_platform_driver()
      clk: renesas: convert drivers over to use subsys_platform_driver()

 drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
 drivers/clk/qcom/gcc-glymur.c          | 12 +-----------
 drivers/clk/qcom/gcc-hawi.c            | 12 +-----------
 drivers/clk/qcom/gcc-kaanapali.c       | 12 +-----------
 drivers/clk/qcom/gcc-kuno.c            | 12 +-----------
 drivers/clk/qcom/gcc-milos.c           | 12 +-----------
 drivers/clk/qcom/gcc-nord.c            | 12 +-----------
 drivers/clk/qcom/gcc-qcm2290.c         | 12 +-----------
 drivers/clk/qcom/gcc-qcs615.c          | 12 +-----------
 drivers/clk/qcom/gcc-qcs8300.c         | 12 +-----------
 drivers/clk/qcom/gcc-qdu1000.c         | 12 +-----------
 drivers/clk/qcom/gcc-sar2130p.c        | 12 +-----------
 drivers/clk/qcom/gcc-sc7280.c          | 12 +-----------
 drivers/clk/qcom/gcc-sc8280xp.c        | 12 +-----------
 drivers/clk/qcom/gcc-sdx55.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx65.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx75.c           | 12 +-----------
 drivers/clk/qcom/gcc-shikra.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm4450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6115.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6125.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6375.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm7150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8250.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8350.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8550.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8650.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8750.c          | 12 +-----------
 drivers/clk/qcom/gcc-x1e80100.c        | 12 +-----------
 drivers/clk/qcom/lpasscc-sc7280.c      | 12 +-----------
 drivers/clk/qcom/lpasscc-sdm845.c      | 12 +-----------
 drivers/clk/qcom/tcsrcc-eliza.c        | 12 +-----------
 drivers/clk/qcom/tcsrcc-glymur.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-kaanapali.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8550.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8650.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8750.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/videocc-sm8750.c      | 12 +-----------
 drivers/clk/renesas/r9a06g032-clocks.c |  8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c |  7 +------
 drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
 drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
 include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
 include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
 48 files changed, 107 insertions(+), 487 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260908-subsys_initcall-05dfd5fb0f04

Best regards,
--  
Brian Masney <bmasney@redhat.com>

