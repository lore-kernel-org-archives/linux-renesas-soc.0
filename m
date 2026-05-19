Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EA3DE440
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177385; cv=none; b=ZGahPjKpt34TvZmLBTK2eS7aCRJon0EAZ3euGVX72v/UHPz1vKHv7nmq0LJvR39kL4OT88ZGTWpV0WvfaCRv45RW/gLwYfIwsQ9H7yCn7ejxnKti06UmqA1Tfn8VEnGanO4RUhfZZcl5poFzlb8QyDkv/co3LtWxAzAIDqPA5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177385; c=relaxed/simple;
	bh=E+OggnFs7O1eqchpmvr8HEZghnFe9zi+NBxeUGGYM8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ap+x0WUmyNtQdCHEJFbsEvd/7Ysoksy7JO1M2o7PoBU6nMu/WXV6sOJEAVWmBMlIaWw7skXh8XrjMLtLZmO2AasbOInr6QZXLRk942LiWcHjwEFAR+RVYbLwZiJNuO34t/mcU1ABNst21ApyZAzEieE3LdkM3gjo0zJF3ie3oFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jfyAcLwG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jfyAcLwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=sUfqZE23br+Hnx
	U4z7m416wnBgVF+Mr5HwejBaSmdCs=; b=jfyAcLwGkMmfpP/PYbRiH/B0suFlAj
	gefoDyNHlaGgXZrsPb20Nl3atpAfJv9MQwq8uJ9s2W3LCC0tyahyDuJQvaUDGYeC
	VgQ+xmIluFEfD6/x5xvFWxn/Lkmyj1Yq8jY3Vwf6yA19Lgs4kC6coHjiAmHP6P3H
	kpGWVzPLhlyH2UPJ4RzWA9KWAqY3B83luv2pUzNkCNTFXRiomD7MSGaJiuM7Ko4D
	t8VZfIoDKiK7t2sozMbEo0VwPS/+F9Lkp6uHMhd9WyE1R+XLAgqds2caIOCn3ZQJ
	bq9ipJgQCI/NQiGKtJqKwCtpTSagnWWA5wTmlJkWV0wYgQFzgGXCCSDw==
Received: (qmail 170743 invoked from network); 19 May 2026 09:56:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:56:21 +0200
X-UD-Smtp-Session: l3s3148p1@YxLTAydSEaBUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] soc: renesas: mfis: add R-Car V4H/V4M support
Date: Tue, 19 May 2026 09:56:17 +0200
Message-ID: <20260519075620.4128-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the additions to the MFIS driver in -next to add V4H support.
A full branch for testing with the SparrowHawk is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v4h/mfis

To trigger the mailbox-test instances, I use:

$ for f in /sys/kernel/debug/e6300*/message; do echo "Hallo $f!" > $f; done

Looking forward to comments!

Happy hacking,

   Wolfram

Changes since (internal) v1:
* added tags from Geert (Thanks!)


Wolfram Sang (2):
  dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
  soc: renesas: mfis: add R-Car V4H/V4M support

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 38 +++++++++++++++-
 drivers/soc/renesas/rcar-mfis.c               | 44 ++++++++++++++++++-
 2 files changed, 78 insertions(+), 4 deletions(-)

-- 
2.51.0

