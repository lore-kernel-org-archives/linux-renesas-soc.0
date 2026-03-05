Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2423131E823
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710568; cv=none; b=d/hkakVibw7SGADGwPLDIvWvpyvRkDjsl6lkt040wijQqIlv//MP989AKq2RJxGKhxlb+2WsoRmQs8FU63Co83h8yqu8EiMwhRnPtuWRKXNz1bLk84LdZEyVKQTmZt0Kc5tYCNhZKAi9epvnaZq/RZq5ig2aaO7Fbpkw9Lbm6Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710568; c=relaxed/simple;
	bh=bslnI6zzDAblJ6or/5cmZXVJm5WyOHjDwWTu/m0o1fA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaCKLPPfQ1O/EMTvVEISC79Wmg+7aqoMNhpp8a3kKQXtwvmPMJwBrYPbQk4fbMJWHeZDNxeUYkTMCIPiw/yeWXnOUxP6YeKi2HrmM7/nb46ho7MGIv7G7iGtPergneT9nXirJ/Eq8E/YUqsgKxhb4caEQoy77KSh0T311rareg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnwyEQ43; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnwyEQ43"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c7388dd6ae9so434565a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772710565; x=1773315365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gyy5fA9H56ek5WkTEHHXIwE3xgEKy4C1ClouQ5oXj9w=;
        b=KnwyEQ439aP4ZAEPEPBFlb6u1DrsxGcA7uvqBiRL5YZ7M4QlPaRmRomENd2iuE6sMq
         GxkV83emPGAUCfob6rrX6NmCyToxzeyVy91FdFIYYdTwgkTfZBPKn2S7vGa9BDoJPRAN
         CLU/zAFLiVOhygDNdbaKnIeG7sRrjDPaysOKtSTGnmlHX/w9zW+M6VcTRmvDHUcE/Tef
         OwtWY7lOCVzuE9QQweTGNCrPSOuliOjrztKVi7+d10cEVsmh1ugH8U7ecKtgZsd6oeMO
         827lwZJqwrvh4DMtyti7+ukgi/IIQvE6xN/EikAGtjkN4NM04WfQSi2GULxMlBiV0RY9
         zCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710565; x=1773315365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyy5fA9H56ek5WkTEHHXIwE3xgEKy4C1ClouQ5oXj9w=;
        b=IRvAg7vRataXvjVkgtnrUh6j1gAtBnssJ5aDyzFBt3VwOtTQG5UH/EioF1VvHBAmEW
         lf8kJ9ysXXTo8jiPrH5fFMCeYrifMIeefTrh1QTsQZHMuHEblSHkNedZTbMzQ5H0Vp7g
         uFKEiTq20Fl9ZXUmAmCh6+svt5ZJXP6emLFVqrIdBHlzEJSMNh3y4eqMKFKASAIM72dc
         xF3r5jHTOtsLNvbUqViP15czWqCoHkYsQNdBm8jwOXYLkx64SW0PnEPbF/tU+PpTYHTx
         OSIdAKJF5+pNA8EwKdsy0cI8MI8QtIGJJMR5yQaYcB4RvKhZSaKf5WWrAo0TroWh8maS
         UicA==
X-Forwarded-Encrypted: i=1; AJvYcCUHPh/PIKSB4gE/1sCkqTLkY9TuModHauwSWv6HOr4VK1f1TQdaLWAuOg3H/mUjhyfdR0tWHtKhA2qGrcwYd1Ndcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyiZ/W5UFP93rFSE3OYmv6YxonCkO0S4xzeNKbgvjHzpjBpU1X
	hiUU+NOM1TKbgU6Ff++R2yeIdBnDLa3z69pJh26hDrjOZCEV6lYJ50tF
X-Gm-Gg: ATEYQzxvx9OCzse2kvbxUI7tHR5Xm9jTxJ/JpN+2Nj2BxAjZgFf6NBkBVySecGp0A65
	wu/PtXj5bP0/o2t4tSXumQaoDUxt6oMH94BanpAzFefASlt3mQfqNXpSJ+9rQK1m229P4/wWyee
	fG1G5rdkf3weKpHnDPloqZ8HjmikXC+xibvQrseVKyHiA/zCqw20ug3dpDzRiAmHOYsO+Y2Wdex
	UfHndIyAPmhE1/ZFvSqR+sPwO5zH6C2XP3Fo6SqSA5HhCrkOyfl5FjbJV9ysKt3s8xN+CX8EWfk
	eNiKnrR1rqqZwJ2y63mLPmt8OZHfAy+jsvxsWPURxlNHetlPSZpApT7f/4nH4tRhcajc31902KW
	6fB+SbvKxkORt85ayKBxLQBpirBSvegU9bOP+tbbVEuStgSt8ydoBG1EYS1FakjqqYvZnb/npZf
	G6FAIPF4TUC5ZhUy+L94BahPn+sW7uZ863v9cgONRPRZT2BC+beKJhD8AzolE4qUr24t9j
X-Received: by 2002:a17:902:cec6:b0:2ae:491b:6f8d with SMTP id d9443c01a7336-2ae6ab1e1fcmr57386325ad.39.1772710565364;
        Thu, 05 Mar 2026 03:36:05 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm78796995ad.10.2026.03.05.03.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:36:04 -0800 (PST)
From: phucduc.bui@gmail.com
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: javier.carrasco@wolfvision.net,
	hechtb@gmail.com,
	wsa+renesas@sang-engineering.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phucduc.bui@gmail.com
Subject: [PATCH 0/2] st1232: Add wakeup-source support
Date: Thu,  5 Mar 2026 18:35:10 +0700
Message-ID: <20260305113512.227269-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

This patch series adds support for using the Sitronix ST1232
touchscreen as a wakeup source on the Armadillo800EVA board.

Patch 1 documents the generic wakeup-source property in the
Devicetree binding for the ST1232 touchscreen controller.

Patch 2 enables the wakeup-source property in the ST1232
touchscreen node for the Armadillo800EVA board, allowing touch
events to wake the system from suspend.

This series depends on the following patch which has been
submitted but not yet merged:

drm: shmobile: Fix blank screen after resume when LCDC is stopped
Link: https://lore.kernel.org/all/20260226054035.30330-1-phucduc.bui@gmail.com/

bui duc phuc (2):
  dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
  arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to
    st1232

 .../bindings/input/touchscreen/sitronix,st1232.yaml          | 5 +++++
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts        | 1 +
 2 files changed, 6 insertions(+)

-- 
2.43.0

