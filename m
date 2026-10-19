Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429313;
	b=RZHy5tf1UtPRsOb9Szu6UsrY1/cwLnWRrrM6bN0ouxXEFmLxTrIPJWT1F7mR7OQIRTy9
	 hYaL6Kh6sPqAG8b5g5zLT1MSXQAvHfqVH5evhqX3hsulOnQlD2UmaurgNkW2uafth0Skd
	 XupV1DdaeO5IOErO3VEaJtVM7mjxfSNTZLKTd9jG3w7z4UJVHLQuTtJpnqjA7a4M/0fQC
	 9f3EEuxl7ugqVEq5tZThgxiEcw8uiGOZROUPI1BDArdytInDWvFFx/UBgy3IQMoM7xTII
	 xDoh3XqFjZ7UF04Bc8AHJ5QKciyy2jNUy8bCMjwDeMFteALJABylhEkE+3pjH1ePFIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/Y1x++vnCQx8M1MrMrYzuhKRQBYLHw+2G0VMFlv/ouo=;
	b=y7PRgtIlMyjNA+DkeiculMimLE1kT63MJafzzat+zhIgjyagU7YvxmwbGG/qBlXu4Zo5
	 jdQ0VqBqDM/me5L1MW1yJXElAAl2T6MPUfo3r7TMerVdGat86O9RZ7hDwUsMCXJ9E8dX3
	 vPB5ZuDwsBbf0Za3L3xrMd5sJiAFZO61+dG6bjGk3Wg+/Svc6PmZthDXTLJpCi1bzyjrv
	 3TCFN87qNCcLFId7FzMYs17uiApoYDe/AqubPGYUxJLPY1f8V98kOWGLjePcDNV9U/lHh
	 OiXzMdrPVw02Y+Jk6joSIjYmqB/gvKq9Ood/0WpOePa/xz3HShq/uRG/vs+KZuaktNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KFrQv4LF;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA260A3811
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 17:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FA260A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KFrQv4LF
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c450ab1483cso113523866b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 10:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429311; x=1793034111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Y1x++vnCQx8M1MrMrYzuhKRQBYLHw+2G0VMFlv/ouo=;
        b=KFrQv4LFhCSJZrq85gLcTa5OLz5IhMYFH7n74va3Rub1pAVLCh2NDTvWoZ3HTe1ywZ
         hD0ES5nXX4OHJCaUbIhw0jYHDR85MJGN4AVN+9HLg9a/sriV5PNYXszZ5SJYSmC+PmzT
         xftPemQoB3H457tzQFnvjPorXiVO+tl9e7b0DZjtHM9D9sG1YkjHFvP4LWMASoayXEz6
         lbKe2va38HTnQVfhVsxWBbh5hN+Z9Q64AxDmtQ/6XYQOzXF/N5qJTB3HIymCZBpip6ti
         ebAcnVaMR7rbsAmWzZ2qOZgzBC9JjsS+VP7NbUxzt8Az1NgAnE8319cmbLeoz5CQZQ1s
         zOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429311; x=1793034111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Y1x++vnCQx8M1MrMrYzuhKRQBYLHw+2G0VMFlv/ouo=;
        b=PUgchjIWt6V02k7GVO2j/juFygI5eTNLpWb4USgOJiR80XiufKQOWWQQKzf7NmMxf8
         1wAp+I1Dzsbs5sRUdku7QmbfXbWlrmomZ7oxkrocu9X2/63QelCPJj/v414PnNMkieVs
         d372kZX/q12x2+Lb83cPUT8Up1S2kjRKZ2/4SCmV8vk7jFOJtffPEcGMLFAbq/ojdSlr
         4uY28i8iJtJnaDQM+Xl5gdLJJLsEcgaLveQGzLfr5xWII6R+0d67c2cBlOVNdqGdVdnk
         j9Z9LFh12iN05NfPjSTTIeklHl9ZadQstrJ7m/b9WQ+h778mrYnYtBvcK40OLEaJo58H
         aIUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwx0902kLcLqXlKJTU5pFir023JdWAIf+rBQBDrpydWRAQwvNSTj/lo6HsgCaDWyHIjf7KBTXG1i72+gPpaPiDSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYHfhSyEidpo1z1qSrXhbUxPj+MsxPpIbGw2vuINujjW3aGAu1
	mrnHBHgjaQ83ADdIFFV8kPGPl2IxEW8SqagLsmPAO1K3v/sxkLYoi4FR
X-Gm-Gg: AYBFou3D0WGZ0xELUF8lYYAC7LjVztcZ7+7c8QtleNqc4JhG7+e/2zvqv36GajdY/5Z
	V+WblPJ4ZnY/U8Qm+03ZOieF15nCkO+fm7CgnMNhteVLXtolK3Sar57dMHaV4ATCdrSz+mtVp+D
	DUvjGTJHdTzj9fMJKeEGCc00leCDHLEzyQk7BAfwBD65BN4ZEchIexWL/cfkJdoBJseYel5ECJs
	FpSg7942/81SkgpSRi+PMPvOBmxKsGJNY2KFDjy922lLZawtdRxNJ3AV5KRTj1kolpoEwji3xHi
	yQEmtH5Qu+ymF6YXobls3CurzkomQSLuNHnvO0Aurvn0V8qlJn7BtWmhLne1WcKpFZkwDM2K7MH
	BDjdSu6OIzmRRU3WVFi4gFkIa7AH54BTI0JJGrtG+vTYKRylDSGeMXQaIsEptMSD18QsORygk+V
	A8m9OCpW5+CusjQb0h5K7VVpieo6AS0qs9wmsFXQLy8G4F7oAoCDJcvGOrwDrC2zrpo61FCtDVH
	pVekOywS89opRf1m9A93mA/tV8GgAtWAg7UKau/6BXIKrzVpgVOxc1w
X-Received: by 2002:a17:907:97c8:b0:c25:4f7c:8ec5 with SMTP id a640c23a62f3a-c419e33b08amr627243766b.23.1792429311212;
        Mon, 19 Oct 2026 10:01:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:49 -0700 (PDT)
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
Subject: [PATCH 4/4] serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI
Date: Mon, 19 Oct 2026 18:01:12 +0100
Message-ID: <20261019170139.473808-5-biju.das.jz@bp.renesas.com>
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

When SCI0 (PORT_SCI) is the system console on RZ/G2UL, the board can
hang at the serial console output stage during boot.

ftrace shows the following sequence:

1. sci_transmit_chars() is draining the TX kfifo through TXI
   interrupts with SCSCR=0xf0 (TE=1, TIE=1, RE=1, RIE=1).

2. serial_console_write() runs in the middle of that drain. It saves
   SCSCR=0xf0, switches to polling by writing SCSCR=0x30 (TE=1, TIE=0)
   and outputs the characters with sci_poll_put_char().

3. It then restores SCSCR=0xf0 in a single write. TE is 1 both before
   and after, so there is no TE transition.

4. sci_start_tx() is then called repeatedly with SCSCR unchanged, but
   no TXI is ever raised again, so the drain never resumes and the
   console hangs.

The RZ/G2UL User's Manual (section 23.3.6, "SCI Initialization") notes
that changing SCR.TE from 1 to 0 or from 0 to 1 while SCR.TIE is 1
generates a TXI interrupt request. Without a TE transition, the TXI
that would restart the drain is never generated.

For PORT_SCI, restore SCSCR in two steps: first with TE cleared, then
with the full saved value. This forces the TE 1->0->1 transition while
TIE is being re-enabled, so TXI fires and the interrupted drain
resumes.

Signed-off-by: Au Dang <au.dang.jx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e4c7a3e14688..94a34dccfe56 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3445,10 +3445,14 @@ static void serial_console_write(struct console *co, const char *s,
 		cpu_relax();
 
 	/* restore the SCSCR */
-	if (sci_port->ops->finish_console_write)
+	if (sci_port->ops->finish_console_write) {
 		sci_port->ops->finish_console_write(port, ctrl);
-	else
+	} else {
+		if (to_sci_port(port)->type == PORT_SCI)
+			sci_port->ops->write_reg(port, regs->control, ctrl & ~SCSCR_TE);
+
 		sci_port->ops->write_reg(port, regs->control, ctrl);
+	}
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);
-- 
2.43.0

