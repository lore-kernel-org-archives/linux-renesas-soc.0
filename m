Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429306;
	b=XPIttVvw+YvdoaGAps8pWpOxI3gDOuuNpq0dcyNkuw4C7E5ekeUIRvmuNfqgNCRW+Nfd
	 i38L4X0pI+K+2IXL3y0E3eODeaFi+4Su5UrQ+1HvrhTcIcObeLriP8Atq9T6HlfRMQtLe
	 DxgvlK66t/yEBndRLDH4RUFRe1foXxaf3lWdm2oAJJekCOWsy9mI5VyEJBvfNE3iE3+l5
	 cU2tN5uMBLO4Yhkuh/GBQDNT7icz76fyNVK7YW0tVjVbhabKpfPHdkpWSD1N6PUOqQjVe
	 4YD7vCBbERtrog267sbd4AJFxXR8anr64pP9bmd05QRmecmE0SGWpiwCY3jC1FkG6Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TLZJ12VmKQ088zh6YEuB3BuBCiEf+3W1h7X9C6IEbck=;
	b=iL5FIKlz/D5+pNQeOKRAREcHuv/TIxjFMcrMXfDGnpaoWRBG/CrVGYXCO5/ZQ5s+IzV2
	 z5xpUpjDcC/oiiYp0EB42DSw8w/6vTNDOjqsZXyoe4edJZTeCG/Z3HvahS39Oj6uO7RVS
	 pijHs57AEo5PrNEN1nPatuXBFwZKTbt6Fr9p7PkApqEniKRlTRRiDrnKN8LlWeiw6Ux+5
	 Lp51PakIrp7rXzaFtzIoSVQ8/2QHYt01UeJm0lEO+Gpykh5JBSNBT+gx6+KDmQJkT4YVv
	 93LVt4fOmXNRKeA6QIh4MHRp3I5DcNZBYl601x3dOXhMp/7w3lP/V7oOMFbNqDGkjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WfijDO5W;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D881606A31E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 17:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D881606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WfijDO5W
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df54150dfso1823461f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429305; x=1793034105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLZJ12VmKQ088zh6YEuB3BuBCiEf+3W1h7X9C6IEbck=;
        b=WfijDO5WDRjz8fW4mOT7Q6HqJMhB8mcZf/TCxmnXkNphcXc+74I8A5TUUUYkT3X24H
         8j2JeQv8+SkQG4RhGp/NUkTNBq9gM58rgJGEaqpA9Or2ezRzcLDgKctF+zmPXicF4kIQ
         nenLDRItutgqj16MY5OI5w2z9SrzQkk1zZdE3/KdZcZ1fUq6n9y1FQk0n+qeCFqOhAzQ
         3f0r7idK3GNGfpU2byZIneS+eL7V6P26yApOH3GprWTdu/7TsMI1QD7Tozfvoy4c91VO
         Idn1uqtzvq9AzhoRoTng/6yaJ7IpjEN5I8p6p/Qx+zkd4ezXTwn8dxqG8yzYUbZkuqCJ
         BsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429305; x=1793034105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLZJ12VmKQ088zh6YEuB3BuBCiEf+3W1h7X9C6IEbck=;
        b=i7f29TRWK8MZMxNsmDYIvesZo5MV53mVXiOwhBR3LqI1/M4V9CN37TOXHD3DzUyMSn
         SRs4lNj4TRrIu2gQa8n7Gmoylf6o3a8Tp2HWRqKTX3oieYX4eX2emu2AGU8o8k81HWDW
         vX/lfCgIfNJmtY0o0htFSsymmw0y5PZmYEPmC7jWiAPBvqgETTSp3eSqAl+R2gfNT7Qd
         LWL3+f7Xoj1C3Brf/N5S8vgSHLtvxvVz2SBbbLXLGYEZyT2pJYpCZMRS0fcZxxmemZMc
         ZmkiY0PzwqnW2h8Lb/LccNBDjlT2CW3mIN7AlF8VZ190cnk7FmTks+DeuOIVwPuWV93O
         Jtaw==
X-Forwarded-Encrypted: i=1; AKwUvBzlLxW7rl9njdxNCChYWceR2g+CkGpIKx3k6emo3IIklkHYZczUPAWWvFuJzXWRRx7hTL3/QaA4WaDLv+wKtXLp7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKlMcIS5BCNhGpynB7fzH4zcokmfTXkqAvIBqoeNhOfgrBEaIEN
	idTh5XRTtgxW6AJUWrCDUWG//I6kBmHVqHd8Z4oMZrhABeV7vUmd+k/1
X-Gm-Gg: AYBFou3JX0bv231YOrZLBidywqo5+xrLN8w3OJzDohyS4RsKKpnIFkLRc8JRAlvDADc
	+owCPO8EriHA6DXmgcwViNeXGmnlbLvaLmbZ/PY9NpZxSrRCIqgmeAbbRYlspixPZlIrBr8XO01
	fAD0p6uot70DP0UFrABa2QTP1t2DTqr6EtqFmpXPn1GZEaZ2zmom93eWLyqk72GU4ev0IDhZ1yl
	tFqbhfjz8pbpN8NREyhnvaI4QQsoALCmwb7tk87zxbOrgYRi09l5K3w+2m4QGWN5heyOdsaxy0X
	jrvxPgs182e1AGxTbG8K1PE3m3C5Tza+8bVwe5P/P16ujz9Www0mdJYraOiwFs9/ItODvY8ThGn
	C+Vu5UsU/1FKTsrGHXv0vwAabPJGJjhzX5sOTL+JlMEPL898orjeA/R/Ry0oNqb5JtdfhlckT0N
	WIs8KXSr83SJZVSoB8kRu1ZDcmM+r80h+3Io9XOylF2wZX39wWRdl7vz2TCtbDFEBS7r3mupLdk
	z9aYG/Y3i+OlTPREJE95/22Swf7kYepIE3WjDLXwcteSo2OYfcL1xCoT5eDLAacDEw=
X-Received: by 2002:a05:600c:314f:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1e6c5e47amr79415365e9.10.1792429304466;
        Mon, 19 Oct 2026 10:01:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:43 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Au Dang <au.dang.jx@renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] serial: sh-sci: Drop TE disable at end of transmission on SCI
Date: Mon, 19 Oct 2026 18:01:09 +0100
Message-ID: <20261019170139.473808-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
References: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Commit f06c2a9000eb ("tty: serial: sh-sci: Fix end of transmission on
SCI") made sci_transmit_chars() clear SCSCR.TE and return early on
PORT_SCI once the transmit FIFO is empty.

The hardware manual does not describe disabling the transmitter to end
a transmission, so this special case has no basis in the documented
programming sequence. Remove it and let SCI follow the same path as the
other port types. A plain revert no longer applies because the driver
now uses a kfifo, so the code is removed by hand.

Fixes: f06c2a9000eb ("tty: serial: sh-sci: Fix end of transmission on SCI")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index bd58bbfa65aa..9eb297dbc901 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1036,13 +1036,6 @@ static void sci_transmit_chars(struct uart_port *port)
 			c = port->x_char;
 			port->x_char = 0;
 		} else if (stopped || !kfifo_get(&tport->xmit_fifo, &c)) {
-			if (s->type == PORT_SCI &&
-			    kfifo_is_empty(&tport->xmit_fifo)) {
-				ctrl = sci_serial_in(port, SCSCR);
-				ctrl &= ~SCSCR_TE;
-				sci_serial_out(port, SCSCR, ctrl);
-				return;
-			}
 			break;
 		}
 
-- 
2.43.0

