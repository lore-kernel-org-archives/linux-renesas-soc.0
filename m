Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE93175A9D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574735; cv=none; b=fJ6uvb3P7MZSSkwPnZ72+LA8TOZZ02r1clwyMhEO0xHRfMIEUHQ4AcRIsYjCLi6gW7j6H+NBNWrw8DECk3lTGe7f2bzYaQoTZIs/6o+K/Hm5q8nVhtuv0t6Lv0MkJqJ/GQ2HnEqkommK7EZ65/w0/G4eHgYkY3IWxBRXNcjcD5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574735; c=relaxed/simple;
	bh=4dHH0h7811//j5T1In6lxiOLE27Lvcfag5EAV+NB048=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYWTXM/xYeS+7Zf6CUOef51nsKOX0qFYNVq1HBLYVifhWcmr+vQxN2ndLZQrsTaeBAxXTfW0CMBAUVTTbDi3C7imqqequIBoKkiDzxwVIJdqLdxXyN2JR3S7QcrHXZ+9B4QMRUKYeHZIZvGcEcP9LHHORgrrWqvvDophMzLbr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2eN9FZw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2eN9FZw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso22579765e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775574733; x=1776179533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YEGPU0Atu5gV0jwM3WLoUYvd7qnqbjH2TWBR26dz5rY=;
        b=n2eN9FZw+9HBqgmwhuzrWt0RBYUAROrUaEtQ1EZPgjHs/zvRuAAeXqJC1RpivAnggn
         89LZYYkXXx1p8WRMf2XrWdVCZQvrE5XJltAcu07Jpkwa7gQlSRE6a38RIK9le6ppzykM
         TeJkqdmFlIbmeQ0HsT0YpR7VXiGJ/iGciGF9kh+5nWlAoaoMnHX8DDPTf92cDiD9HsRD
         wmoRV38zteSFjEidYKEpPYnA0eAH0w3beZebZmiNZk92tF2pPD+VGQ1haDsLrExXEUrn
         mA5j4q3QxUPynmDXekjufJoqJRYW7IDHQ2DaYkqZnspAcbZzeqRsUTdgEgUL5vtN35qD
         CvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574733; x=1776179533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEGPU0Atu5gV0jwM3WLoUYvd7qnqbjH2TWBR26dz5rY=;
        b=riwPTqW41AvgJaRmyn4Wwe5hAjzil551Y0YJBLLxcoL+iTyUc1qHy7hUhOxbQnONk1
         m90h69IuJb+4DTOIN/vk+zZptNMFP5uvfy7GvB6xE91XHNXEXHBfHXtpPHPBcvg6ZM/R
         UdGX2S+FRXU76EXI7DQvWNLRtU4k71AhV0xLHnbrbe99gCMefPV2txrceNawJRRterkq
         /R/MOYbq6BXyaLBwvpA6b5XoIHdszoHpF3BQa3RZYrjiMz0sUY7pe7IiV+i/kixmYEko
         cDVBNqAV8UPWedjDRb2ygD3W/fs8Jo8i9lG/686GzJQ+QCS1nZ3jQ20bsbg2/zzDJ5Vf
         bm2w==
X-Forwarded-Encrypted: i=1; AJvYcCUMpHKmkT/emoL759weSj0Vom5ZzgKsZsjF+MbcQ1pePGEPYTYx/GFEw+MOY5XAn8w/mUYm9abhKcjm/tuIahKejg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyua9z0g1IxN8Xy0bTz8oqrDhfnJzkjBjX4NCP+l15fCrd3bVdV
	/zNi9uzmE5xoT6eBxBKEowMZn9AkVAr7l1mHW9QSjUQxoQIsRGIHXiNo
X-Gm-Gg: AeBDietWH+FrJ0EApQiaRkq48R7urZfogghgdrI0detkwH7Q44ik2EXOCH7fVE5aUcb
	zbut0CjOhRjmNufj0o38CDQKdsY65m6Yt6h6sj1bARXC+XEDi/Jlpv1Zt3lA62YFwfutOHBJEaD
	bN2uES02or3HK9d0ZsmMkzknCDJ+ahjbU1CheEAF4cXXrh3C1Hgdt9uyDA4B4p6UY15Eu5psQTM
	Kt6AhNpGiyLY2xVtCUNSED0gSObvR0Bsf+mHHC36Q2vck2/gEtWR56Y/B2wH19nbDmSay/F1dVe
	D2i5CqhITfTLQkDzb2guIr+usD9pIfDOR4iC9NYAFFlnGpwXxDbmFh0sOtcHZ89CTP8sQ1003i2
	99CGAkcz3qE6tjU3TyJ2I/T+jraz1Zyyiw8uBE3/DsKwen6IH009VMKsENqoZdWHSpXdbhAyDm1
	4CcyF42VMYRU8+TXFBUnhEkvVZLxeNmH8RSvssy6w5cjmink1v
X-Received: by 2002:a05:6000:401e:b0:43c:cda2:4f2a with SMTP id ffacd0b85a97d-43d28f8df8dmr25550860f8f.4.1775574732772;
        Tue, 07 Apr 2026 08:12:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:3f9a:11a8:20c3:fe58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm54488360f8f.33.2026.04.07.08.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:12:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@nabladev.com>
Subject: [PATCH] serial: rsci: Remove goto and refactor baud rate clock selection
Date: Tue,  7 Apr 2026 16:12:05 +0100
Message-ID: <20260407151210.102693-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the early-exit goto pattern in rsci_set_termios() with a
positive conditional block. When baud rate is zero, the clock
selection logic is now simply skipped rather than jumping to a
'done' label, eliminating the goto entirely.

No functional change intended.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/abPpZULsXhRmXTX9@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/rsci.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b00c9e385169..0b92173f8f45 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -265,20 +265,18 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 
 	baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
-	if (!baud)
-		goto done;
-
-	/* Divided Functional Clock using standard Bit Rate Register */
-	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
-	if (abs(err) < abs(min_err)) {
-		best_clk = SCI_FCK;
-		ccr0_val = 0;
-		min_err = err;
-		brr = brr1;
-		cks = cks1;
+	if (baud) {
+		/* Divided Functional Clock using standard Bit Rate Register */
+		err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
+		if (abs(err) < abs(min_err)) {
+			best_clk = SCI_FCK;
+			ccr0_val = 0;
+			min_err = err;
+			brr = brr1;
+			cks = cks1;
+		}
 	}
 
-done:
 	if (best_clk >= 0)
 		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
 			s->clks[best_clk], baud, min_err);
-- 
2.43.0

