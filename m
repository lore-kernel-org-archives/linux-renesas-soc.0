Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67081C84BB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149632; cv=none; b=RS0U5xocpKLJvUGQPRMZnDx2wkkBJU4fcomDQqJwPTB/xWdPbDCh7Dww+s4MtDbqvoVOp+gVhW/vUr2fQ43VagQfiFYgX5UuSizYvDZMjH+s4flgFVcist2jUM8nv75wTBFXjNV1N+W2CQafsI99o036hkxC9MmqW1teW4ncSUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149632; c=relaxed/simple;
	bh=vIqwXAqU1HsYBJlcwii1d7KCHucu+av7KUnX+u4usSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvdTEaNHTkbs6CzXYKUjw/0rmcT4vouB2zgFuiKsn2d7GCogcHxHf4xV3rlB0v9kesBbOEPf2kKcLd5mZgJ1PXIOwqtUP3k9LvShHbjnbgmKN4Pt00qNKHF5Lfuc1ZLnFV0ymfZfdIOVhvDF0moktNHOLvbkOJ+A1VSHrCu/5s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcYgbN3D; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcYgbN3D"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84592b55832so22061b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149629; x=1782754429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba6sP+0COuG6/GPgP0Uhk+kq1740BlSFeDZq6i6dVkc=;
        b=YcYgbN3DO6iZZTYAghyNPlWtMs4tqx/iuDCEEkKQ0JvdxVtOI1NYR1cAR3WTOUI5aZ
         eDAoeyPlzH/tJv3cjySPQOgHa4c0YjslFZ8wQHi6wMtkYOQTIodL4BXYHp4ofnEfniLS
         MsvmUbkYaj3xrYqMsg+spBDv+WbW7sqnJZmb5cwZ+WvxMMIr3PwBAPu1QwEfHuuX8B7j
         qSH18qQtJXx66oO4EUGZDD9m9wd8MHIkMq7wBEdokjPkWQsA0yZ0Qz41AEqLrZFnCdgX
         9s8lmeEXYbU1FBnID8qtcd/8TL41EHPbMGZxPl1dPq2j2Rr5p1l2iyfs9MoEJ6gFzP7U
         xnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149629; x=1782754429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba6sP+0COuG6/GPgP0Uhk+kq1740BlSFeDZq6i6dVkc=;
        b=rXfAFHY/7Ebu9/BUVEF64dVOdMHqhXCW+YCIyhKj8BYZdDGgsZciW3+jBLFgWvgR+9
         dMCtZgNgsdu61m67LiTWmtjCU2sGDGGzFGNks9UUn4ZSBiyFSIHtN/RVre5aJFqy8h7e
         7PyWjJB24Du5HEvVBpl8wqaUUB+eWnh2tskbngNuUMgDtGJ/bWt+s/0qYWZC3PBEYbyy
         jUeew0v97v3Z8nPYhhOyjEuqtbs8BYN9a7nekremahJRfybISEY2ItKzCEnp31v4KcBo
         193VsPozyqmfjOH4JcfqCsEop/FhYUxqsbUYSGKetWTSFA1UGVSPYDWBKFeEmYrjS+/h
         LlEA==
X-Forwarded-Encrypted: i=1; AFNElJ8B3YnbEyC0u8lLTRhPcXEOp0reS16iax2JlW2i/BX/zo6rc/qce2JDS18lx+6eoZ7VDtPHkb1dpdd7G18NejvURw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFKHoErpTh8FPzUn8ri+3YEeznlcIBVKEaVOIVGyKKiEYpnvs
	3WzaE8bkWqDsm5uUm70Q3e1Df8kQjjqKDpZN0lcpmRT+TWs2PDT8+7pq
X-Gm-Gg: AfdE7cmSclJFopPs3bNcwLb13c+2QmqQQ0fN2FLvU8LAKjC4Twv8cPn2iuRAsoFB8zc
	dDUh51C8vYloKtVUgY7bbmdtNWX48pBhu/MoyxivJtOwULzMtlZ4Jekn3WTv0qpy/r0nWnK2ILb
	TlbH/nELhoCdfHENpx9c9oXLftBhcsC6wj4F/SDUTBGHzbwBJ9LFhR2iKf/pF40NP0dpU4mHGiP
	kpUrI6AxI7xFzaH5RlM91AMTd7qF3HcNUueIezY+KQjJ3AO0NpumfieSzwY2tu40nGk7trAI+ab
	I5EVyhjShkOQ59R2Gictv0J1swARt3OdpkVs8ZelrDjh4x8YMKuuK6yaS4BuUuBldl31BWue1q/
	E7zVt6O3rPreRv6UpGXAoCOPXVYjSKihfGFuu9zfWxX/ZSlCl3gz+JWsVfCdb9mOVk1bRa7V6Wv
	SvXB7alt19MjY4kmHBvUQWJAZbzlvPOB5sAIYwDykIng==
X-Received: by 2002:a05:6a00:3499:b0:845:32c8:e77d with SMTP id d2e1a72fcca58-8455615862cmr15752950b3a.34.1782149629087;
        Mon, 22 Jun 2026 10:33:49 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:33:48 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:35 +0530
Message-ID: <20260622173334.60491-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*** BLURB HERE ***

Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)

