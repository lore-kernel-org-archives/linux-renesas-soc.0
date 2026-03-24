Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65953F7A9E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352953; cv=none; b=W8mrP5v5iT5UKC3XklQH0EkRfhEPa/qOIxvQkyZ/CnBl17uJmG5MXV5ChJmnUUxoBVgu1+P7WBurRFxQWC6vpn5GaXvp6PhhjPw08FkB/SThlfWT0mE+Y7EpxxonJufVI7ksCKPEFp3CTBVxG7/1BmGd4pkI7pEPi1mo5+sCHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352953; c=relaxed/simple;
	bh=snLLRbym4+ew9/elKCySb+mytpFwTEnmeFcssDn1HYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ie0+6mMPqUnFJNr2T7xAtruPhNixJTjDK9fvEGleSiBIlyFE2AzenJvbEwE2pFxjM+nE+9zwmWu/WSiU0dIX+/Zh2YeDOqVFjjbUFVbUuRDtDMXqfX0kCBzgVD8LsKu94tY2QpcJKkDtKnPo5PL0fCX6Gx3KICzMbhpoCqYpHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CnWRH/Rz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CnWRH/Rz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39E11C58098;
	Tue, 24 Mar 2026 11:49:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E73C86011D;
	Tue, 24 Mar 2026 11:49:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6A7B1045034C;
	Tue, 24 Mar 2026 12:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774352945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OU9cevG5tQB9wG4AjTQEsfdGFIMRAmgws6xJlzfZFVs=;
	b=CnWRH/Rzy8SWfCwEX5g80heTJmaXvBjGfF12AhdEONe1iFbnNXYqk+sLGOlD2tlwzmrYcY
	7JbXYC+FOR7a54f2jupWJEjxejzz65yZJz3t2iwXWBw1qiq23eGrcFN1ehzMbEE8k7ufAJ
	Jh3ovbEiENPx1h5YCq8XhuTHw9mrdlLHP/dKL9A1bkEPqnKavM9Tt62K7EfEgx/Sol59H2
	onmiji+hcmI8PFikYTyAi7LcGtmRdYZ4MnW4EPB226NyHql0UXEfd+vbE322zI/iY1KEv8
	Aa+qqcXRrKcOjtMtOdfSWH+KGpqaJygQq/tK8fTVug1kBehI4nlzjgMbaTQ4Kg==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Subject: [PATCH v3 0/2] watchdog: rzn1: Minor improvements
Date: Tue, 24 Mar 2026 12:48:43 +0100
Message-ID: <20260324114849.242755-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Patches present in this series are minor improvements of the RZ/N1
watchdog driver.

They were originally part of the series adding support for direct
hardware reset [0] but due to recent modification in this original
series, it no longer needs to have them part of it.

Extract them from the original series and leave them alone in this
current minor improvement series.

Consider this series a v3 iteration to keep consistency with the
original series where, in v2 iteration, some changes have been requested
on patch 2 and tags have been received. Those changes are handled here.

[0] https://lore.kernel.org/all/20260313092417.294356-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes v2 -> v3:
  v2: https://lore.kernel.org/all/20260313092417.294356-1-herve.codina@bootlin.com/

  - Patch 1
    Add 'Reviewed-by: Wolfram Sang'
    Add 'Tested-by: Wolfram Sang'

  - Patch 2
    Fix dev_err_probe() message.
    Add 'Reviewed-by: Wolfram Sang'
    Add 'Tested-by: Wolfram Sang'

Herve Codina (Schneider Electric) (2):
  watchdog: rzn1: Fix reverse xmas tree declaration
  watchdog: rzn1: Use dev_err_probe()

 drivers/watchdog/rzn1_wdt.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.53.0

