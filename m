Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C740A924
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317480; cv=none; b=XwPO10IDf8XyOhH5auHSWRwdnQQY7TEVEQp0+VzU7zH7nJlEdhWW7tzrFeIhO+CmuPPBqNyrypYJQbsL/oleky1hgjfIzbh34giEf3zCEfS092f/p1hCDB4mCnj3gwHCItHszuiwMf/xEk+N6sJ2yF/WqCbPIxw9ONoBdjme/UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317480; c=relaxed/simple;
	bh=YgY7MmgNWF4PCQpEW085GVVHwn5d79Wod2Vx0eEDImA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6lEglIBeC/cpVQssisO/FVEjNAmDTxWxc+NedbHl2tPPaq2jX3B8eT7+BuU5x6ZyfasjFO/8RKikwYiKq5wxoYYkjovRJoqIroypACN8LQXJIKJ5XpWpEJBHHRgAYtyqRqJhoLvDD/xwpjM8cJWaJ7Pd+iy0bl2A+TXSBqXOsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4nNbRum; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4nNbRum"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so637865f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317478; x=1785922278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCffGXNXVh6VTJaSMw9eegv4mgFfdt5Rg1B+50sJ9Os=;
        b=G4nNbRum5b8xRGPKaKTKvRR3InRsSQZVpYU2F9UrYLEWxnS9JXyF+QjhsWm8cHX7QX
         PKe9PRD61eHENBZIi5zscEXxhxbuE0rTugsfeU1ryzvJSth8fK4gJj7i/BRokFKfdCXb
         xrw+HH+iHe1g+QHTXIAuwrinl3+9aSl6Vaoq1UqLlCPCctvfVbOYkYlZB4kzejVkkquT
         J+vEcY8JFABQlvTKEaJ5VSv0+/aQS82w0h0FuqezKLQlD9Ucow7c19ehclpSlBh4I4Nt
         jXTnQ6K28LB9C+iIuGPQZ5UtmISU5tMldkdQVl9mEfjLbn02xf6XhRSmumE1/4G04P5p
         bmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317478; x=1785922278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCffGXNXVh6VTJaSMw9eegv4mgFfdt5Rg1B+50sJ9Os=;
        b=s4jpunbFDxW+ltEcutYBqHcdmkDw20u4RfanSzxq/24rRmqiYkSR7lGYEpnuJMEaMx
         JaBr+oPyIQhJnMdsBgxtqJizEfdIEkvmFDBDimDA3tmXzcLKKXbDS4BVVZ1RNe2L3DZq
         mRz4MV0FdsIrCwYr/EVpqwFhzCclwQYAMAqS4G3mJTA9wr90uLErWLGOXV/GRVfH11Lm
         nAbq5fEpJeTMON2s68Y6HqxtZrT0lC1xxOTbJN/t3bBpQ3+q/QcTVNwG6Mn/y18qNRn0
         UCNpB9dMCyn4FuhRc1uL5BaumrkHgGiJqASO8FH+LqZEWomYj/sXzKdWwE/WcS4JXarq
         2JNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2CcDzr69KuMVjocmBq/kTSfvL4r0Tg8ux+bPruz+eTF2+ZBx+KcgilE5L43H+UcrwCJI/10wmA/InGPS7aTo2Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyehJ+z0JL7nBTLQ4ozpZsRGS7jlmTj8KWtgETSyw+nk8HsQx8I
	6JYSpa2AwkjhjJK2zeKVbLBeshrzVysuQrKWtIymEoHmhdUzKhW8ALRH
X-Gm-Gg: AR+sD12HrWUbD4vW0DZ7WOJuHiDEAlLvuiHvNriWWfsxsGGrBDsyclqBMuDQ+esPCbY
	Lkdib74PiosAS0djnrEKmJkR8zDoOnvBuMYrKwfZqP3XrK8y/OICBh0RA9Yo6PaU4ZLuUwEa4Jg
	x0dupV6+/9Bi2g3dSH7TPg82K6YnN6nDuhrnCgn6dWMyqCTqK4HpXGjRAvcCO65q35LvMGU2SW9
	Q6ebz7embzsUf51TgUi0DDeqBItlU2AwZd1U8EIxDTwIDckhoMob+s2NlFSgOugkx/bdv6Pq62K
	LAQ8XhCmU13rTNAOzUk44vwUEvv6zkXHh68O4Oiq2HyjMvulrbPdJO7RPRr0pz35hfvgA+LfCdt
	VTQ6GfAPtrqftuvIj5tS+YH7+c/jUjkQc0S7SEfl70BBdlE1h9R5HGsz3DkQSQeDDlxW3pNr39L
	bRXAdSX+ar5tY2ZL4qk7YkaGR2GNsVJyJs0lz8Tp55uS2RCb0/FIA5ui8jUWAV1CgD5DpjRXTxQ
	rWkcMBrXZZBHCrat/enieNl
X-Received: by 2002:a05:6000:70b:b0:474:cd60:1154 with SMTP id ffacd0b85a97d-47fb1f21bf7mr5962899f8f.41.1785317477473;
        Wed, 29 Jul 2026 02:31:17 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3935sm6766388f8f.4.2026.07.29.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:31:17 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/3] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046
Date: Wed, 29 Jul 2026 10:31:08 +0100
Message-ID: <20260729093112.98324-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
References: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SYSC driver registers a "pwrseq-pwrrdy" auxiliary device to
handle the PWRRDY power sequencing, which requires the
pwrseq-renesas-pwrrdy driver to bind to it. Select
POWER_SEQUENCING_RENESAS_PWRRDY from SYSC_R9A08G046 so it's built
whenever RZ/G3L SYSC support is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdf18ed2dfc2..86baa5bdbab9 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -493,6 +493,7 @@ config SYSC_R9A08G045
 config SYSC_R9A08G046
 	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
-- 
2.43.0

