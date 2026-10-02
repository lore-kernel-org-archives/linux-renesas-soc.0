Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C48485949
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939836; cv=none; b=NTR3J+R1viXMDVG2lMN9IRIg6mJA4cLQPXjqgOWjrWHi438C8IcKKp8WMkYP5fFdVyRzB+so8tHCol9Oo+x26MB+Q2dOEvJKFC3blKmHFy+tmPQjEPTV7ciDSiY0JiydV4xvQS67gXIJahB8C+F2AOyomz6ELgTUZe/roAFbjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939836; c=relaxed/simple;
	bh=CmLrMZDEFCFjf0/ltPteTPdKE4jvMDiebeJLrvfX7Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=js8h+afSAcC6158ZxKZEO/uwoJSAnX1IS23ODC/WeyiYr5meuKctQ4axXtM3LtVOmst2tkqK3NBY5Q+mXeIelNbf2ZSDUMMQVGGvke06rvtgTP+o0oLN9nXsRZF1ujsKL4jJWVR+pM4MNVj+TpDG7NhIdCM4bqsEZ9iEEoH+xho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRor3bTd; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRor3bTd"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so820423f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939831; x=1791544631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rXPAQNTukHatAjRMX+f3U9wK31jYxBvXurlQwmOf4ow=;
        b=dRor3bTdky96+30jGcEMDquI7XsMTkNj49wmajzN8DHqj1XHHuYh4XZ7ukHlTgFlrU
         Kscp56LS5F8KyHbQSZl6tRV0H5MgpZx8Jxxj6O1DK79wvj7J6JacKDvz/J7ke0w1s1Z1
         TvdKmFFMdadLsAXH2E0Glz06mK6MBs/yF88Tx5KVUE7Yaiyabl6x+bOZKdM+Fxjkpopw
         I8qHwqTZ57v51y8JJ4FDd83OL/mUkFylj14NlK/KmvpQsCl7jX1mMeVmnKovISAhjyxB
         5lAvvfBoW0edXND7LaLFMBmEjXeBJ/NHTNma6rTOABND0LlyLDJME2DutUCxp59DHT+x
         BBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939831; x=1791544631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXPAQNTukHatAjRMX+f3U9wK31jYxBvXurlQwmOf4ow=;
        b=G9VSoUg1nvw91rOgSiw11DrwipmPZ3e6SbR0xiMsFHs6MuN6dwPqd5L0Tx/ofxLhOB
         pxzcA1LUrguL33YVX3aiF3ap5NWaWu8IQyWoFmOSDBuuYmIlNqp6gphxtfTh4AfBXxii
         KRSnfnGYJrtWgSe5JVuaP2QVoxWV3DroknUhW5SUhtplOz3yZ51dg6XckDVcsXJrvdq2
         Z8+EEqYM/chvfzKNUncDNVlijO8Wfk9/P4rFRAu2VvwBfk6yMS+sz3uloPPtgFh6B7hO
         APOkc5cNjNUrnTbnp8NLmp3WvNIJ2DXwXEaoJtK2DGWCfVUFoqQTh4UOmzNyk2CNCzB2
         D9oA==
X-Forwarded-Encrypted: i=1; AKwUvBx03MZiLxAZlmTLNIytBcuShlWWuhAs3/hp3fXyNY0TpM7HPRAkMIty2wdQ82SVjl4t2zWiDbnowi3VQrEwm97dLg==@vger.kernel.org
X-Gm-Message-State: AFuF++ls92U8Pt1unUXJN0QGjKkUGd6xx6DlYvUttHn/B1wuj7ENr5JP
	aOpoMJo7x8tAFq4BCLwszSJbOXgRWVbg9OBvtZCHQi6lfcfGM1V6skFd
X-Gm-Gg: AYBFou3P9Sjhh23NV6Pd+lNPrsYBsZi9fzTLP+o/3GCbAErtHrVw/4cIPPY56uxcITg
	NYUt1RU9Wkfp8wYCix4iwWn7Q8mBaqihE8WRjO11Mv8IvbLkBc8GXRHFL4zlMJk5aJVvFpGiBLA
	V6lh0YW5tB2O0Dmces0hPbicy9Lgkm8xAG4bR0jKwI1cGYa3J4uPMMf341q47rgOJcSOKEtzZdq
	h+SoDf9C4uI9cbnzfcYxS7qeLqmz/kgZua6O4o4aVBUXDeqXcy6v0Ki1PrUkfV6ES8EoSTT9rtn
	nRQ5rsW2bJv80WzyRRKFxaOHRgsbWhjpH2VvyNtnZXEqOWsV37kyhgC+gV2IJbq/z70ZYxip2M9
	0nWxF73vPys8QH0eVbnIpYf8t+QF1t7C4OC8GWsjVW/U4SReZPugySwQXFBngw2m/Xbwh0FH+V1
	LXaby2/o0TW5U9OpD03ogFPqyx9TTzk96IywyuBDGG5UgWHGshawtz3WgACq4dpcEOfcD9EsPCO
	spUgkg=
X-Received: by 2002:a05:600c:8519:b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-4a02769f7aemr48487305e9.25.1790939831187;
        Fri, 02 Oct 2026 04:17:11 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:a3af:1973:c597:abc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm73324205e9.1.2026.10.02.04.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:17:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v10 0/5] Add RZ/G3L USB2.0 Phy reset support
Date: Fri,  2 Oct 2026 12:16:55 +0100
Message-ID: <20261002111708.234957-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add USB2.0 phy reset support for the RZ/G3L
SMARC EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
  All patches - Reset subsystem

v9->v10:
 * Updated cover letter header and description.
 * Updated commit description for patch#4.
 * Simplified rzg2l_usbphy_ctrl_pwrrdy_init().
v8->v9:
 * Replaced pwrseq_power_on() with pwrseq_enable()
 * Replaced pwrseq_power_off() with pwrseq_disable()
 * Dropped redundant devm_add_action_or_reset() for pwrseq.
v7->v8:
 * Dropped SoC dtsi patches and will post later.
 * Collected tags for regulator driver and binding.
 * Avoided code duplication by moving devm_add_action_or_reset() to
   rzg2l_usbphy_ctrl_pwrrdy_init().
v6->v7:
 * Dropped PHY subsystem patches as it is accepted.
 * Merged patch series [2] to here
 * Collected the tags.
 * Added additionalProperties: false in regulators node.
 * Updated commit header of patch#6
 * Moved the host enable patch.
 * dr_mode changed to 'host' as function is not enabled yet.
 * Updated commit description for patch#9
 * Updated dr_mode = "host" to "otg" in {e,o}hci0 device nodes.
 [2] https://lore.kernel.org/all/20260707145135.247565-1-biju.das.jz@bp.renesas.com/#t
v5->v6:
 * To avoid breaking bisectability, prepared a single patch that
   does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator"
   rename in both regulator and reset drivers and that could be
   merged into both trees.
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected Ack tag for regulator driver changes.
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description for patch#3.
v3->v4:
 * Updated cover letter with merge strategy
 * Reorder the phy binding patch for easy merging.
 * Updated the commit description for patch #2,#3, #4.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
 * Dropped rzg3l specific platform driver.
 * Dropped the tag for regulator driver,
 * Added id_table handling by introducing a common probe().
 * Dropped renesas,sysc-pwrrdy property for usbphy-ctrl node.
v2->v3:
 * Replaced items->enum in reset controller bindings.
 * Collected the tag for reset binding patch.
 * Dropped clock patch as it is accepted.
v1->v2:
 * Dropped patch#6(Introduce helper for regulator registration)
 * Passing pointer to an array of regulators to make it scalable.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
 * Added enum instead of const in the compatible section.
 * Updated schema check.
 * Collected tag for PHY binding patch.
   in the regulator driver.
 * Added regulators group node and its children in SoC dtsi.

Biju Das (5):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++-
 .../regulator/renesas-usb-vbus-regulator.c    | 75 ++++++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 92 +++++++++++++++----
 3 files changed, 188 insertions(+), 20 deletions(-)

-- 
2.43.0

