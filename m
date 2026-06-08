Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD6938758E;
	Mon,  8 Jun 2026 20:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949784; cv=none; b=TeeVG7brRFOtdXLy8eZy3ffeL9cJ61SlPtuEwvyzGJ5nLSX7ymZlUR0dMh+TjJZkyjXMpK3uzu8xeEIjD8SfPSLHcjK8ErsMzzA7O2I57TMWc+MqtyqQFIeLiPZDpezfmt0kOmw7fHX28mgGy7yKRocYz812d6+D1wvJsTqWP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949784; c=relaxed/simple;
	bh=N1xqqku7uR8j4MmudmoE1QyakUwjPnmHOb7F+Ga9uy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+e5k+VOlIFRPaE/wuAt/s2hpk8lElhTqdmdm/9kk1AkDUB2uF6SYJgiJ4fG5qdobI43CJcegCuAnziaRyQfpYEalX305lNUWMiJKme/TKsvhMxA+grcyYMxaR8YtoowjYfVPLjPgUWyNHKm6oGFDszSeMjqpA4qjTFgeLF6v7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+LAPTwQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+LAPTwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67971F00893;
	Mon,  8 Jun 2026 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949783;
	bh=wqM6/GnLxJaUFO8vrbASPnnDqBonjG78AYUFZyrjnZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q+LAPTwQ+77UoECCCrrriYVtn04/cGnUMk1PzaSWWR3pZVYwJYkmUaWhLEjUPfSUA
	 UVJL2T928DIGqSsefqKeMrAXMAELpLlruqyVb0E95pU9CnXDxUwZcj6pQuTWrAS0UY
	 ulgWtpLcl3/0u8JvpDP167H4yTsmJmawrcOCZLIsUzwX4Dkg+57xtoxZ37IWU3JOIY
	 gpqx07pwhL0n10kn/9/mFmOG5raCEGM0hjNWReogXQhDR5ZpAn87UWefF2LvQNbqjX
	 1rBuSmQigah0x2EeCf9vVG9lBE5OLez3sxk+zJnDjG9LLWMeZh4yuadrqAu5ejm0Ug
	 ogV8z2A6+zW7w==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 10/17] i3c: renesas: Return immediately if there is no transfer
Date: Mon,  8 Jun 2026 23:15:36 +0300
Message-ID: <20260608201543.804902-11-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to allocate a transfer structure when i2c_nxfers is zero.
Return immediately instead of unnecessarily allocating memory.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- updated patch title

 drivers/i3c/master/renesas-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 4a055c9f4ffe..1fd39dd57847 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -1066,13 +1066,13 @@ static int renesas_i3c_i2c_xfers(struct i2c_dev_desc *dev,
 	u8 start_bit = CNDCTL_STCND;
 	int i;
 
+	if (!i2c_nxfers)
+		return 0;
+
 	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 
-	if (!i2c_nxfers)
-		return 0;
-
 	renesas_i3c_bus_enable(m, false);
 
 	init_completion(&xfer->comp);
-- 
2.43.0

