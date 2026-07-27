Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E731D367
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178164; cv=none; b=tYax6/zd2Q0v4IKXwXsX1I5UFbHjvG7Tz6mtGv1hUw/NKhc7i5+SAfltrJSXa8GtNJpW9RebefSjcAvcS3HtYRc0cRFi8LJwojGRdxHnSZLZsURBUvPyt8o1G6gXdWH4X3AjnVjixRWj4TAaYQmRy/Pc4oD/MAV1rjYjvtNJFls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178164; c=relaxed/simple;
	bh=aY+sYp6iAChM5C87AGmVQMFM6nI852Lmi+YugxFogXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCG0ACe3+33hQX0YaiVTJFYrcsQBzGaPl67yrEmL3NvL2wyqj8KScKxrZzgKlBq1EHlGuYbp1pEY7/qxOBy/nIfaOBcQUYSqCYt+ojyD/Qzpfkh8yUbIdctOY4SyuaZu9Z4JHAO+bfx9ilE1f920fIvDrRUFqQyEnLQUexLQa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh9B6Hyt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh9B6Hyt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso3488635ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785178160; x=1785782960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOOQ0RbG+6Okt3l/2iuoRB6TOovgsF0/E+IS2qm6bW8=;
        b=dh9B6HytpP40vn5YZj+dqYY3QIwkUCZC29AffgnRUjoGkIWHTiwIkzghLnbhMh3xOE
         fHK4iXUuCAf23PoelqfxVZUgVSB0HUMlSTFEWvrnYwIj3E3PqtsH3cfQufA2WpBPIcrX
         JjvLdFPK79LvmSHVW8F+H1HjYotTnszokCJNgYbm+iwsPp8266JWOXUj0heWSqbpmLdp
         DrZuNOLezohAhDes8IQ71gBYy3r084FC+WEGEGN8WVvEcUdyT6uTBYHCUuwycc259CJx
         EdC5OuS5nUNxuCRFX2eWmt2HUdOWF8WyeXeR1pO8T5eroIb0SkvR0k2e5YLzJQ8z8sQM
         U10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178160; x=1785782960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOOQ0RbG+6Okt3l/2iuoRB6TOovgsF0/E+IS2qm6bW8=;
        b=HVjfaoFnf787RKrN62asL/cZJxM/D0WqaoEyaiVuZzps5Dl352O/2i6NAhetRmvYl8
         sDjnh1CCe6AoSwrdR1qULunoXQc14C/2LW8tqpAK1nGWsVOBRbiPQN8Nh7HRj1DsTmI0
         9/sCkVGEPseJysiHQe0vXP8S5GdtYv8FRKYgwzgeU9em2VpYeWwOLEGWtHp8TO9Wi3Vo
         OudD0l2D71C3ysDcTRa6Bb7FSyS1pBrQ8Zat6hNpSTgm8enIKLHzTZgPxYpgoIqAfWHE
         Q9LSs0iHPJtoK7l22NZF3zP7Z1VJsTqZa5aub0xeqdReF65jcvOJMiojrvIFMjdNvpbq
         6Abg==
X-Forwarded-Encrypted: i=1; AHgh+RoLjCQbXd0LaYCzdP7TXBjQvT0wd0kHn8Y+NlwqviCG6VT9teex57g2edJHiwyro/CTxspx/ki0CCocA65NlpJCOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3OxURZ/R5GamkSU7NDOlaHXMPPenyUGsMa76+IZZXZxEgnemL
	y0mMHZUU4Uf4hcgB/C8JFwnOtVradtVwOeGjtNPSctq1uGgNnngkKYwZ
X-Gm-Gg: AR+sD13SLxaQNfBn2jGQws81WJ3qDsxuASFKoE74g8oEPUbeQ3vc2wKvjcdpUGRj5Zg
	raMvgRquI+lKTPb2BetxJG8965oa2lrKeeBud0LPQXalB4p2/kGYx3GO68bn4OgvVa6zmaYSD+V
	N1bHEIdEDYu7zdu7rHxtTnyWIzsP2EdpqS4/hI3dyELqduV7cb/4fPwQv3j06cd1i9PEMGl5XVJ
	/M7tg8qHzatkc15pJGN4WDZqbQYsoRf+J03eJk8Qztls/IdQPlDgMdgHPmokvYkM324EUSUEaSW
	bHv3Z6pnPU3ScoF/2EdELLKZ3dJC8pLLAvUNfGuGnk/YzgpWYDivoYTGSpYo6U43z27ZXztZ1El
	iyfTmQU7D26Ca3Jup+aKqO3yMd4E6/yE5OEz5B85i1rDAug3vM3r8pzXoz6YnzqiHRrLt+jRM
X-Received: by 2002:a17:903:1acf:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2d00e883983mr5892545ad.30.1785178160609;
        Mon, 27 Jul 2026 11:49:20 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d7b87sm40186245ad.57.2026.07.27.11.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:49:20 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 7/9] iio: adc: rcar-gyroadc: remove rcar_gyroadc_set_power() helper
Date: Tue, 28 Jul 2026 03:47:44 +0900
Message-ID: <20260727184755.2055414-8-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727184755.2055414-1-ekffu200098@gmail.com>
References: <20260727184755.2055414-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rcar_gyroadc_set_power() just calls pm_runtime_resume_and_get() or
pm_runtime_put_autosuspend() depending on its bool argument. Call them
directly and remove the helper.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/iio/adc/rcar-gyroadc.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
index 3a17b3898bf6..d38cf3caeae0 100644
--- a/drivers/iio/adc/rcar-gyroadc.c
+++ b/drivers/iio/adc/rcar-gyroadc.c
@@ -159,16 +159,6 @@ static const struct iio_chan_spec rcar_gyroadc_iio_channels_3[] = {
 	RCAR_GYROADC_CHAN(7),
 };
 
-static int rcar_gyroadc_set_power(struct rcar_gyroadc *priv, bool on)
-{
-	struct device *dev = priv->dev;
-
-	if (on)
-		return pm_runtime_resume_and_get(dev);
-
-	return pm_runtime_put_autosuspend(dev);
-}
-
 static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
 				 struct iio_chan_spec const *chan,
 				 int *val, int *val2, long mask)
@@ -200,7 +190,7 @@ static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
 		if (!iio_device_claim_direct(indio_dev))
 			return -EBUSY;
 
-		ret = rcar_gyroadc_set_power(priv, true);
+		ret = pm_runtime_resume_and_get(priv->dev);
 		if (ret < 0) {
 			iio_device_release_direct(indio_dev);
 			return ret;
@@ -209,7 +199,7 @@ static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
 		*val = readl(priv->regs + datareg);
 		*val &= BIT(priv->sample_width) - 1;
 
-		ret = rcar_gyroadc_set_power(priv, false);
+		ret = pm_runtime_put_autosuspend(priv->dev);
 		iio_device_release_direct(indio_dev);
 		if (ret < 0)
 			return ret;
-- 
2.43.0

