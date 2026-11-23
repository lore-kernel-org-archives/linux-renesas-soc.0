Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433888;
	b=1I0zb/RJsPX/9ixPjnQLXZbtr0rvHHkNACuTtMsXUaJN8odqnklcyo46aCM+TGWNMh4c
	 yCmCh5tPCG1zI2TD49HmkpDtq9ZLaIhw0sBnLWOLNbCG55ipX7NioY8dF0bjlMtdW2h1Q
	 fucBSyBbos+BJ13W6cVkxyHb73ovKfne+NHijMYM7nxhshV+wsLoHwVjt7yDVE2VMWDQH
	 OReOpJ6T7r69OrXswg51dJnLPjl3DB9MJuWMa9V1JxlxWMkS+Z2FdDVW0q3NPksQO5YHK
	 74Ebsr8QfBVjS6uzdwoS/lottrZheKH8XNSR/wfIo7FsrkOq3ndKOywqG1v6Pmaf08w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Khejrep24yyzWEzO9hkzlnH2dbaJOCBXw2GKcHL6sSY=;
	b=aA8S30VbK7jeVjfVohhmGp+Xx+P0zBBr7MpyvadPGy4EUF7BFfM4dyf8c4eR6i9nvlgn
	 2XdviamRmld8dCa7lfH249tU2dxb08/wfHQkAN2emgtNAxa35/4XEM7KbS3hN+5w3yYw5
	 WFaD8i3tfzW73SlIIfOUAMbQxrs08NYT2OvRIZqaBB3IgXe/YVn+MxpVp3wAoV+rlUd+4
	 8lwkDiEZRCG8gyFRfSFaqx90GXnk024UO5N8aU3laSDRRQZMTrE8vft9Qh+gwEotM7rAK
	 ja5V79z6MuRO7Lnr+3S9AHarm9lUH0OWqoNOYEySm5YKgAemz2EBbL9e9PAMFT0Muqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jbwLwmRe;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDDD606A31E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 11:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCDDD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jbwLwmRe
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc758830601so2511613a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795433887; x=1796038687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Khejrep24yyzWEzO9hkzlnH2dbaJOCBXw2GKcHL6sSY=;
        b=jbwLwmReAKQaVzUeDss8ILk/irYQPtopTRHAEKOe0NAE1MqbTcPOn5e3Oumo6x/hs2
         Xg6czQO/GvobpeNaiQhKfpfd2fdafZIofzRqva571GhAf1MctcvfdDrAmDmsY+//qlui
         rlFPW3Q4x/V/wd2l3OApWrJ864LrtLJaL9wOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433887; x=1796038687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Khejrep24yyzWEzO9hkzlnH2dbaJOCBXw2GKcHL6sSY=;
        b=PIwP9h1pFuXT39WM3ZpYVUaict+pn/XglZFlLZYFAHDJM29/rvXLAaU4fQyd89Iql/
         RmIsLGWdO9431CgSk1OHtTvwaVkZrJPgZguEFcYnvF+rCkxY2CzNgAnMftzrbCmMUIC7
         1E+Mk7Bf2MBORFPk4UKuXecnqEOZKq/yoHkVQTOSp7J2qng4OIuR/uTWdfsm2rUBrbog
         N3pT6VV+0lY8WhzD/Moxhq3GeoYP/4v9BiBA+jLqz2th4/S14PJ0CoPA7FwFCtULLVM0
         +Ow+ECeBN9iVlxdZ9eGotrPiJSqhhLZiKiP+alPRRdwQ2f5eDZs2V1unydpfhUDQNa5K
         SDGw==
X-Forwarded-Encrypted: i=1; AL+hErGiHjeNNDC6cdAsUmSXNLDvMOPhfAaPz6Ttj2dZptndEfU1utiadw6B8v65q8go0jJ6f9BTJbinXXFw2k66WW+NJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8PmHqbhjwNY0dmkNhCGG5hxnZ5p1Ukut37lmhgINPAPxizdyLd
	6WtP4XKAholtmHKYB+nf+zbuQobu6zXe50lLkfPKxT+Kro2CtBvTWP22PsyV9B7Tsg==
X-Gm-Gg: AZFdTZeoCoiHld0yr9FS9kB/lM2ALogXwNxHGup3WsQda7qseuvLAIQP1lVMLVW66r3
	1ook6DmjXT7Xud23xIjHjeGgCIBGr6TdUhMVDkJGAkJtrTmDq7CQfz150fpYkKICJfPCgsghTrD
	Hmmbhp+VkoKH2e97Ff/lX9V8DuVh0kHrZqwbNziBuWcMxx2rHgJOBFXy0aeWp7EuSmOCH0MqsAc
	YD7IHflVDPOel8G8aX0Sr3/wRQeprrVr0UAuTVhy7h9svBYMeJuN/falvzDf2WPIDckfyUl9pUC
	c+gMHt18m+HAYjxCyzi4JqO4l1X68dDPwI8e63rgMQXlcSPbCfsWUkJgtZYWEGibgVCFlTBr8a+
	GnbUnrjGFyro1YGjoLZTyCqvHeQnKfXd/xArYIqYi07fnOfQgWxl2gqVYEicpJNjHJ2OHasgY2L
	Th7JwhdFvB7H7+LM4qY7TCbfN8fNsBI0O3DTZfMah2s/3gSZqLipRj8RmYSX10gn2yC5/QmK+VS
	HbOV0D/lKW6SI1uh/pXapheIxuLB+IUOkX8IWAB/WPoLoJJG5bjh6zM5XsruFPtPNn5Rk9sGVub
	BhUvf/OshzlPAdwjjf7fB8msV7Pew4jaxI312sbFJtv5IRhgQS4e6Rxvfvkm
X-Received: by 2002:a17:90b:3a45:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b41c8fed61mr10151391a91.20.1795433887289;
        Mon, 23 Nov 2026 03:38:07 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:ceb5:5e59:832f:d16b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b405ffa98esm20358101a91.17.2026.11.23.03.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:38:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] iio: adc: rzt2h: Make POWER_SEQUENCING dependency optional
Date: Mon, 23 Nov 2026 19:37:52 +0800
Message-ID: <20261123113755.3033436-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Commit bdfc454e8567 ("iio: adc: rzt2h: Add support for RZ/V2H(P) SoC")
in the IIO tree added power sequencing support to the rzt2h_adc driver
and made rzt2h_adc select POWER_SEQUENCING. When combined with the
in-flight USB core power sequencing integration [1], this introduces a
recursive Kconfig dependency:

	error: recursive dependency detected!
		symbol USB depends on POWER_SEQUENCING
		symbol POWER_SEQUENCING is selected by RZT2H_ADC
		symbol RZT2H_ADC depends on IIO
		symbol IIO is implied by HID_MCP2221
		symbol HID_MCP2221 depends on USB_HID
		symbol USB_HID depends on USB

Since RZ/T2H and RZ/N2H do not use a power sequencer, rzt2h_adc does not
strictly require POWER_SEQUENCING at build time and can use an optional
dependency instead. However, rzt2h_adc calls pwrseq_{enable,disable}()
unconditionally in its runtime PM callbacks with adc->pwrseq == NULL on
RZ/T2H and RZ/N2H, whereas the !CONFIG_POWER_SEQUENCING stubs currently
return -ENOSYS even for a NULL descriptor.

Patch 1 aligns the pwrseq_{enable,disable}() stubs with the core
implementation so they act as no-ops (returning 0) when desc is NULL.

Patch 2 switches rzt2h_adc from selecting POWER_SEQUENCING to an
optional dependency on it.

Patch 2 relies on patch 1 at runtime when POWER_SEQUENCING=n on RZ/T2H
and RZ/N2H, so both patches should ideally go in together via the IIO
tree with Bartosz's Acked-by, or via an immutable branch from the
pwrseq tree.


Thanks
ChenYu

P.S. This cover letter was drafted by LLM. I think it did an OK job.
The patches I wrote myself.

[1] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org/


Chen-Yu Tsai (2):
  power: sequencing: Allow desc=NULL in enable/disable stub functions
  iio: adc: rzt2h: depend on POWER_SEQUENCING instead of selecting it

 drivers/iio/adc/Kconfig         | 2 +-
 include/linux/pwrseq/consumer.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.56.1.831.g720f3f5937-goog

