Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279549;
	b=r4qejE6lTB6Eethyin3nllrPIU4im9Y9DVHV1SR41yqE4r6LaPHCG6Bt7tFhJA7ajxsb
	 WLRlCyytaiV6H/xSoUH5TwKsrl/Y///4o9AHA/n2fdleNSK5jvSxH9Eg8DKOGv9+qYuc7
	 t6faf9OtsPknMmE5/6WU/6kKrgymEeDDdn80gKJtlOS8iltqwtfEQGc/b6nJ8kTt2RJ/v
	 dAJWHoTcu4X9YcAN+R3wGNrEYqUvapZnrqh1ThVEMQ84eyswzI9SBxiUZwLur6UQoRFJs
	 FpRP8JH+4ZaCZACFP6t8TaHp9dXr6EYe/kjOpbG21n08W28Xaz24Q13IZBq6jTUdPTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
	b=rffipwrgty5IKLkmhms9SDMSkkc5uczDWGb1YKNc2ELY92DcT7tpWhBw2wbovZVZ/y7m
	 6vL/FiM4Xa6tslRTQLxTjyNa8uW1Pq7HxPT10zp5swlBPT+gUjEL2U6w6gPfQVaPHekV/
	 Xlzhz+Bcz6VYcCJIzzVN+yGF+yjTd4Id6AkbzjchXqZ0sw3uhaKLZ+TFG4DspxaEEantm
	 ThaR69qUgwzrZolW57bmY4rqrTlLMRzr14eO+ZZYCTZvRNDGCactEsDjynV+wPCW6yVnX
	 gJzsvaNanUZKUqdStOgx7ORumhfcTE4uJfDkykIny795BcngU3lTG/16/fnEXS97a7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVs11Bvb;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95325606AA1A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95325606AA1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVs11Bvb
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5365f9a04c5so20074281cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279547; x=1794884347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
        b=tVs11Bvbn2d+gL5BWwC2m/viV4nrJeThHyuvCZDzw1Fvz4vCP0E4CmVRFsXywgJHIY
         7LTSviGZ1TH20B7cqWPSnImrklhjzzXSicv358px46izZzvsVQBbXufQHCZex31NLJbV
         1Yjqu7vKkr2sQr5GU2L7sVRoDf2Q5elBoQwKzbOiDy7mr3QzRgDLTrmevKYP3F8DmsE8
         agMvIRPrZcSXmAJTdEh2fkLpIG4smUtofpVr7fzO0snW42MVbShD+ZXHAfITn7XFOMEZ
         EIy4K5RboZwR6wZEonkflUS3wV0/xEQyuMEOSpthO7kX5F+LZJ65NH55+Oz4iWbrg4T+
         Q58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279547; x=1794884347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
        b=yMz7Sq0CfdIzGXQzDb92agA23Sn9EXPMBnavQsWXJpR1L5CiLV4VO9RFATGLgxNtJr
         aq7tPmdP9s7CIW5aPEY7RBTQvwpgZI9gmyJ0UVD0GXqXxu4QNglAt5kvq+nnhuzXUpoU
         9IisaLEC0vzmVlL5a7l5RNwnkqRFJMVWZtYVM5LMlnf7LuleI0N3ILemMFVbGXdndN8b
         Y0RjhKYE3MI1jhsxsEiHkbHnWn8fOs8Wih94j7z9fVm+bQiqDdc79Ea/JIdLaIwF9+Tf
         PymDcm1GEJ1TelDmH27FviQKVReOByyFhrCAHElyBSkKPLpMuUlE4RkXytPzdZxhJFaj
         BQoQ==
X-Forwarded-Encrypted: i=1; AL+hErEBnWULoyifAAFQ6NSmE+7M6gJ6T3/w4Hn5JYbe1e23YyOCRn1T2+KxBVGbSUdTbVNRC1tfYOMrUF9NqkTWjmiNew==@vger.kernel.org
X-Gm-Message-State: APuU4Z80DwBW6r+o/FylAZmh9XQ1aB2UiqgwvH7K7/bvaA/tNbsSeN2s
	qgo4k2vLGdkP9Darvh24POX3qhNqZeuH8CxJI9kDH/SYjFLgHliLIb0=
X-Gm-Gg: AYBFou1EaV8K4LfKly/cZy9Hlz4AQFxTS2XjKsyc+fZIVdKNdE3ftE0n0GAEZneRoV4
	EqtXszV9ywY6B+sSiGggV/m8oh30xJSOcYtfIa7736MlNor6i+r/uyhW/HIMItb5OxueQUuBNJ8
	PjRnXGzx66fSgzgFP6lI0Sq1CuihleoZZj2di6l8Ca1cMI4WffHphJNtdF1Baokj5MZ5cpRCyV2
	X2aQpOqGxuErqybn3mEnFfz7AIJYPFn5D3plNaimDSeS7CibrH0QxPmlsxeWkUaLVorMw1wiUNi
	bQrNkWznTRxCpmdCrYSSbQgz8SvBXUZNMNzyvn5dpUr+QuUpP89frVqmBGrcGyXqYcX7kgSledF
	RFa3jg1LGooqr9VUDA7wArJPq4A/XGyV8nI5/+mhy1KOh62KkEcPjX99eZ/zVInyZFRkXfSQT6b
	ubhEe9wy8EGpT1qstaweyQEQWeUsqltxDGDyxYOoV7ZvP1jjoH6VML6SljqwjNAgUi0mVg6sFGT
	bBSO5JD2/KwWFnRilG95q+Q/hT7AWwUMnGyVdUcymWfw+WHF3eHVDWg/0Qt7QSl6oE5K24xhU3h
	Tacm+DruOND6YdUnNZNmbyNroEocW7PVEWz8K0iZfJjhgt6mHNIvcboGnKXSyCcuHB2KS2UULck
	PHjJBw3+TP63vlHl91hG/m4PRSJ2RBXja11lOHJBMqqhOa5J33SIAVhmXk+CPULMR
X-Received: by 2002:a05:622a:4c6:b0:536:6d2:2c0e with SMTP id d75a77b69052e-55527b1b214mr20635311cf.36.1794279547476;
        Mon, 09 Nov 2026 18:59:07 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:06 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 0/2] media: rcar-isp: fix core IRQ and probe error handling
Date: Mon,  9 Nov 2026 21:59:03 -0500
Message-Id: <cover.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the core IRQ lifetime before distinguishing absent optional cores
from initialization failures.

Changes in v5:
- Regenerate for git send-email without wrapped diff lines.
- Use media-committers next as the base; no code changes from v4.

No hardware runtime testing.

Myeonghun Pak (2):
  media: rcar-isp: release the core IRQ before destroying RPPX1
  media: rcar-isp: distinguish absent cores from probe failures

 .../media/platform/renesas/rcar-isp/core.c    | 44 ++++++++++++-------
 .../platform/renesas/rcar-isp/risp-core.h     |  2 +
 2 files changed, 30 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
