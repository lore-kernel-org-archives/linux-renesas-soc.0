Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726467;
	b=Gqf6urb5MEKI0RW5gNq/CwOYFeSjSytslYkbKs6QduBkqBn0FwCrAgR5Gt3xhxNGbFuM
	 ZawK7JFvIqfEzQwPrTrWyIiTq4S93kWEzs5JCY0hIpAFC6OB4MHWYwI8qa3/e6KD47vVZ
	 2urlYXBWNKaV+2m07MMhrokLvXKnHDypnv7WPH3Y84mowIA1zkUmdWJBlB6+bLhr7WWvH
	 mdLH5quh6bX5G834W3JzH9LrXNC54+CDXtKSl3BlDHHh9ti93tC0IfHqY0r3zxg8TozKX
	 2U3Vc/O3+b2x/8HIBTv92+RDfHH+8DYlKSkQ/rwS8bHvYEgaQUWN6sUx92z930c3ZvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VdlowWmvfVZz+69VMJzw63b7hr3S2rAy0+a2cDKUzcU=;
	b=0bMq+JZskXodCFHccEkzD0zoWQ9D9k0NXAda5LSJ6Z3PjSajYPzhTELLcAVAOLrWnEs5
	 Jhol3jwJyhYsu1pD3+HSNZDlKBfIiVjmbs9Ao64AV2eB+jvhZY7c3D9iAV6vJ0OXELbZC
	 vGs71N8lxlqRjEpQEaV7yjhtKAYK3LFxHN/wzHF4WNaeQO+hsN+2ssvw7nFbw702EkfLO
	 KIh6pe1rYakN51c7MQN+bNrlYOcraMpWbre7Xrmnp1XibyrFtE9xSypxADUebiGb72dca
	 aCiA25FOj3XSpmKWKCCLuV+vlbM9nJ7AVQo/vbsa0sEXC7lElaGbb06kYOwO0UqnQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05deI4v8;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE6606A328
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 17:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CE6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05deI4v8
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so29816215e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Nov 2026 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726466; x=1794331266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VdlowWmvfVZz+69VMJzw63b7hr3S2rAy0+a2cDKUzcU=;
        b=05deI4v877peuDZQXCEGpNlQGGkY0C1DEG6mwexeXb6DKhOP/4r/F8yyJFq+u8XSVi
         1R0zeaNPtZgl5jLlxkZsB053TbDKyphEuFYbbGLnWmaq5OWIwl0qUHVqAfWOP2sC1daX
         EyilZNTvQD5ul3BdNUN3qdzoZEv0R1kGnG5WHFn4GyFYa9yQfupUPHQNIfB8g+qjN/It
         XS26D5Nfm73PiA2iwcIC0Vx/xD5R1NOgH6Y+X7NZHciJzCyaDpIPr1jc57GEuwm9JqpS
         GEDBO1piSAaLm2+vZUQLzkQ7HAZg2tSVz1aKrg1Mywp4ovv/GIBzGHXqxxK1RhfNk2Bn
         jcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726466; x=1794331266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdlowWmvfVZz+69VMJzw63b7hr3S2rAy0+a2cDKUzcU=;
        b=EZOY4spk7yKQRziYnBhC6/z/CkRArePi5GWLNolqMmVRtAV8R8U41vGLiPyu9UK0TC
         4agFHAR6a3qsjbWL70to+CSzFam8QDHuM27o4F+iav4LvJWLFmoItufkCoWktteA917w
         tOmHn51mLWhqEsajHw25UEBgskjnzAMIFunNtuAPYHMii13MDlaxuy1eHZPEYgsGNfNm
         4nl7MpN+6mHohfcBSfIrIizqdYi3pr3XCUKzir8h6ODCM1QJV95Y4/ntOhez4XfoyDn5
         IF6YwKM8Q5tIRkCt32bMEhu477nHABRP1/H7GC0+6Z4HFtnRTRn3hS2dPA/e49kJu5ex
         mRXA==
X-Gm-Message-State: APuU4Z/u3kj65ygzgNLvKYaXIuLSKj/jVIKS50kGewaVORWFG4X2vy/L
	UUmhDrVIeQa5squOoDI+Gd3djJMCacJRLUUaiUO20+mysnqiFTesk2T9
X-Gm-Gg: AYBFou3GgRWGHuB4tPkz6WDmyuSmn7uo4sgwWWRAvO2TfiVw84T7IrqUut+S9a5hYaS
	QY+9BKJh+0AZReoNccVUsyPWy1MgxQ7kDSSDz8ehiuu7NxG6HUzSopHInXfiGYOc2NDnEdsJPYF
	TBEM+no4zTyrDPlGYR5GcghkqOwtVZ6p7U4dRnUSXbxrr6FtD6SDANKLlGTsDj3i7cnpk4LEm9A
	hsNRy2x6SW2ugSOwaJ+pDjqsDIAMi4P05v36aWdV5yhHi1lKVgHqoVhs3WEWPwCCcUspEbex7he
	s7X21A4wBwgB79+kGIJbLFEmBikBp+NX+X+8ILKqRwnrInixj+7FJjL9/6A3cK+eHIGrXqZ0HrB
	XyKpPaxiQmgr81bhgDwwqd5be6ESPVMvysNfrlzPFySctQHEn+DNU9qTtevlfFjJ4bNcI1qJY5k
	lhR28evalOaOVk2dpDsCLhSTfLaA5wWBwRmdVlQyLbcjC7I3nPRTgJKc/mb4YCQnKZM219KWeAi
	nQts8lkvrDrRIDAEuQR1bOKSRnxB8eVF0XjrVcywa6AjJquCnHM2qHGe6fgEa8VXe7DjVU7nYDe
	s68HMSQbjbK2+Ml7op4rFgqc4a1/3Cyhy3It3AYItM1shD3XthwnEsTnVPWwirQiYNUHdEpbkAL
	t1zsZdWgui1yCvnfb6wmY4t3FW9PwXmRLd+p+COI=
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr287850375e9.29.1793726465631;
        Tue, 03 Nov 2026 09:21:05 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] clk/drm: renesas: Improve RZ/V2H(P) MIPI DSI PLL parameter selection
Date: Tue,  3 Nov 2026 17:20:53 +0000
Message-ID: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

On RZ/V2H(P) and RZ/V2N the DSI HS clock is derived from the pixel clock
produced by the CPG PLLDSI and its divider (HS clock = pixel clock *
bpp / lanes), and the PLL in the DSI block has to reproduce it to within
0.5 Hz. A display mode is usable only if a single set of CPG parameters
satisfies both the CPG and the DSI PLL constraints, but the two were
checked one after the other instead of together:

 - Mode validation took the CPG parameters with the smallest frequency
   error and only then checked the DSI PLL. A divider that lost on CPG
   error alone was never tried against the DSI PLL, so modes were
   rejected although another divider or PLL setting would have worked.
 - The PLLDSI divider's .determine_rate() runs its own search when the
   clock is set, so it can pick parameters other than the ones the DSI
   driver validated.

The first two patches add the clock-side support, the last two make the
DSI driver use it:

 1. Let the DSI driver cache the CPG divider parameters it validated,
    per PLLDSI instance, and have .determine_rate() reuse them when the
    requested rate matches.
 2. Add rzv2h_cpg_get_pll_pars_validate(), which offers each candidate
    to a callback and returns the first one it accepts.
    rzv2h_get_pll_pars() becomes a wrapper passing a NULL validator, so
    existing callers are unchanged.
 3. Evaluate every divider against the DSI PLL limits, keep the one with
    the smallest DSI PLL error and hand it to the CPG using the cache
    from patch 1.
 4. If no divider gives a usable pair, search again using patch 2 and
    take the first CPG candidate that is at most 50 Hz off at the PLLDSI
    output and gives a DSI HS clock error below 0.5 Hz. 50 Hz is at most
    2 ppm of the 25 MHz minimum PLLDSI output, so the pixel clock error
    stays negligible.

The cache in patch 1 is indexed by PLLDSI instance and shared by all CPG
instances, as the DSI driver only knows which instance it targets. If
there is a cleaner way to hand the parameters over to the CPG, I am
happy to rework it.

Testing
-------
"modetest -c" on [RZ/V2H EVK] (DSI -> ADV7535 -> HDMI, 4 lanes,
[monitor]) lists 27 modes instead of 21. No mode is lost, and these are
the newly usable ones:

  mode        refresh   pixel clock
  1920x1080   59.94 Hz  148352 kHz
  1280x720    59.94 Hz   74176 kHz
  720x480     60.00 Hz   27027 kHz
  640x480     60.00 Hz   25200 kHz
  640x480     59.94 Hz   25175 kHz
  720x400     70.08 Hz   28320 kHz

Dependencies
------------
Based on next-20261102 plus two patches from Tommaso that are not in
that tree:

  [1] clk: renesas: rzv2h: Forward PLLDSI mux rate requests to the parent
  [2] clk: renesas: rzv2h: Report the DSI duty cycle from the LVDS divider

[1] https://lore.kernel.org/all/20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-1-47f23de6bdb1@bp.renesas.com/
[2] https://lore.kernel.org/all/20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com/

Geert, Biju: I would suggest taking everything via renesas-clk
with an Ack from the DRM side, or providing an immutable branch with
patches 1-2 for the DRM tree. Please let me know which you prefer.

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Allow MIPI DSI to reuse PLL divider
    parameters
  clk: renesas: rzv2h-cpg: Add validation hook to PLL parameter search
  drm: renesas: rz-du: mipi_dsi: Improve DSI PLL parameter selection and
    cache results
  drm: renesas: rz-du: mipi_dsi: Add fallback CPG PLLDSI parameter
    search

 drivers/clk/renesas/rzv2h-cpg-lib.c           | 109 ++++++++++-
 drivers/clk/renesas/rzv2h-cpg.c               |  15 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 174 +++++++++++++++---
 include/linux/clk/renesas.h                   |  38 ++++
 4 files changed, 300 insertions(+), 36 deletions(-)

-- 
2.56.0

