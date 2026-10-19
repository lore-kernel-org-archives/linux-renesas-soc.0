Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429311;
	b=lmVgRI6ZGxBuNFWMdu96GRapA+t5wvZwc+My0o+n1KNw/9iCJzK278LFqrbxnQZ+lTBi
	 m2gARWrS1QLKkeBP97+nTtZkYLTp968QcAa54XmTkwaQt4e+ZmQ9YzPbBtrR4/bcEZL8G
	 ad5mhBIcLo6Kaf4McncPkaHFY5Qxkw+dNNGqrAZfB2BkGr2wvW1aIlrVmBUh1PorbOkbw
	 O/4+sFS5cHCqyc854XDMAEEFt3G8WAJsdJUMGnB8ywPBj6ClCg73cthRJtx9YP5hVoYMM
	 +1WT0a11CYK8dgivMfNt0Rg3pBM3yq4bxpW/wyjFUHXjRdACfcBYp4YAJtlYujpGE4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r5VXnrteDtiwyhCjk9bhH4hMMO3JPBb3BFlXcONxZ0s=;
	b=hVHtGCkbvH8KuakglcmIgEKmkYtL7cKTBKiZUvG1w8z3bRPZNBTKNnBhOk7pOpYiwmnP
	 /o+HfnrSNOIOd/IV8um3kVG+M/Yb8uCgAHMKmbeXzzm/XlFt0WZ55DWor4fd63YNNJjFj
	 oM1pXhLR0FCuU6r3KIOHACyKF9758m3dI+fmC9z9zr6Q9BV61U3bldnm84WgGKOcbqzrr
	 lA1FrsD8jTVD/EM7kkqladWVvyBydBXkEq9YLJMvZ38acow1FKInd4Ixp/gHX/25nPemC
	 CRTTOhAR1iRsZ/vwW/I/mxdX6eIyeXmlGdIfvSVCXH65EQnvjXbEQGGvSXg/tmmHpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k5Z0Uetx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79CA60A2627
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 17:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79CA60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k5Z0Uetx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso18797765e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429309; x=1793034109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5VXnrteDtiwyhCjk9bhH4hMMO3JPBb3BFlXcONxZ0s=;
        b=k5Z0UetxOSMvmrz0ml/rNZCpNQov0H41drmFbH8PiVo4AiF3pNApCTHIgs1K2rw7/i
         cFUgJUd5f/37Izl0lsRHI4a7lSyK/aw9Bm7o/zqp1wsjCnFy4GEhRCvgUjjQexHoHpSM
         1a0wv11cqK770dSRClE9PyuD0BoQ9wPyApGcvJriUOqqVH3FT9Wd51RXn3Zqvd2BG935
         1E20nTAT36wvaCsgSfL/Phsgz9dgXaDIjxaCXKC4OMHVcofRNSfQsAyChZIolcA80eYX
         ALi8Qv9PmC6fetmBiq+eIGxovyLGtzcSrWWTurQoEe1b+4bqUn+IzTtvBP5lZrAtwR4A
         allg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429309; x=1793034109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5VXnrteDtiwyhCjk9bhH4hMMO3JPBb3BFlXcONxZ0s=;
        b=CwZ4ZCjWyOjTHmH6xxAQzH5/4zWPb231gjXwuUb6cKS8kMExXbp4Y4jbEpex8ciU5M
         mhabesiQhHeOFyhtPgXzzcEhWnIAmzMnJyc2yDJ303/T79BvrZYMKPm7WDyTeQdK7Xfp
         8sEplWy0DmSGa1aox88+byIsmP3uOQ7zOZuHLGq0HfW0Xwd6FT5+392Mzw15crB4SEKj
         mVFXVyayY+zc8HMNJHf0mahoE9j5YgddzwtLG/JyViMekLubq25KP/oIA70RcllOxbdt
         +P1oRnkUKv+3uB16d7OlYQeTYxrhM9rBpsOiE9ZIFPi8ELHXhnZhoE8uSWvctIc7KWx7
         OeGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzalAlKYsyUM0KmLnB6W/zW0PUgj+KbRG2Tz5O2LKWt8auxKZCjWbtQaF3DOaipeRu/qoYVZFqndicT3reOK7OiLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZEeFC5Pb0fWO/8qwvcZ6uOiDZ7FdjJEVGPMfwWLceX+Z+KEe1
	4L68E1GhKY8izJV4O302yGEE86J6iDc1GN84Rx//xJTUx6kJbrdxJebN
X-Gm-Gg: AYBFou1l5zZAdJiw74cjvD90uoibQ+y2IZcBC5NhOmdVFR5GmI/fFkhz0zzBrwlvVa9
	P7bE157N8neK+lNKW5ROqKHLCQSdO6FY6hm9sHv75qK+/aCMFDqo6K5pdLwENEOjbHnHzq4cLAu
	F9mKK2zfLyomlh4PBVcav2Y5/y1ZtVK2d40cXR3q5ru9r9yxDlsHyScKj5L4mCfpX8e9V3bwQ7s
	1/kdSNwqxjj1DsSbwHkfrE/UpoRAqV0n8SVqWnhXU8bi7v1w5OZl6k5voRNIeHsQ0cLhcuguChM
	EXQbhL/cejRZVfBAF0nUuZ9fGTf5lJeWQFzsYC2EyxPBB0JF7V2aIetruToQ5NgO+gZFan1rAbI
	51BkUpReuaTKudEMTkhQOTO545SKLfYnxOCmecdcGi6GUJthFu/Hyv1ppVutLbpsXDbxPKmm+v5
	43xyROUGk16PdUeXXer4TDmz8Ze4NAnPQ4mc4VevFxf9sx+Q4SSNSgl1ktkAOVneq2VWjOF3gKd
	sklkFvW3YAvHV+mOMYndIa0Y2u7bsyN9UrWrBq/PVQ5rM68Fests3ly
X-Received: by 2002:a05:600c:1395:b0:4a1:c6fe:5c0e with SMTP id 5b1f17b1804b1-4a1d76148e6mr175520865e9.33.1792429309188;
        Mon, 19 Oct 2026 10:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Au Dang <au.dang.jx@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] serial: sh-sci: Skip TDxE status clear for PORT_SCI
Date: Mon, 19 Oct 2026 18:01:11 +0100
Message-ID: <20261019170139.473808-4-biju.das.jz@bp.renesas.com>
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

From: Au Dang <au.dang.jx@renesas.com>

On PORT_SCI, the TDxE (Transmit Data Empty) flag in SCxSR is cleared
automatically by hardware when data is written to TDR. Clearing it
again from software via clear_SCxSR() generates a spurious TXI
interrupt, which causes the last character to be transmitted twice.

Skip the clear_SCxSR() call for PORT_SCI in sci_transmit_chars() and
sci_poll_put_char(), as the hardware already handles it after each TDR
write.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d577f9de6259..e4c7a3e14688 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
 	} while (!(status & SCxSR_TDxE(port)));
 
 	sci_serial_out(port, SCxTDR, c);
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
+	if (s->type != PORT_SCI)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
 }
 #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
 	  CONFIG_SERIAL_SH_SCI_EARLYCON */
@@ -1049,7 +1050,8 @@ static void sci_transmit_chars(struct uart_port *port)
 		port->icount.tx++;
 	} while (--count > 0);
 
-	s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
+	if (s->type != PORT_SCI)
+		s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
-- 
2.43.0

