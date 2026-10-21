Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588401;
	b=HP3H9UP7h9r/YrmSNC3j5nq2rQXqzoXIjKB1lZmzXO//naSz5gR3lJLIPqGQhGprQHwX
	 7M4MGaI6xi36SBESJLGD5Rur+s/ntp3qFyQFCuZgQd7nLz42SgSstRFptDTAhX6SGlmcc
	 fzK2/06Vj2HzjQ50ZNehcfxcZb4Sl6lODt54AvKlb/PZUyZrAIix/Rc7TQ0uHE0hhfYla
	 hyV60x0J92OkprSztBKr1ierNvTIL19QPkA4djGK07gxigkdZzhwUSpBY2G4nZc/OBOMd
	 tPxNaVOgjj1FRUwgO5KkfFVdWkABs9KbLOE/NCvk8oj4YN0CKs7QpLk8Hc6LlNQhieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
	b=KHynZ72abHv8xtG6jL0cvFTUChttFpSY3xv6clDdUA7Cu6cUbUrQkTf5xJuaQ7YiPXlU
	 NDt6XHrdCFpLKAb9P0ZSE6htlGlH77OtmauaCYACb4EzaJN7RnQmISR3FrYT95NuCjnCs
	 tk8b667JsitbEcZAqfMp1Yve0GxSr2BpXjvsEaAgvZJKbtxhsQf4LZ+m54VPsnGFJAwne
	 9XdH37XJkJlnmdrHvr7fZvFtDPEEXr6AjeApcL8uWb97JrlDxdC/R6jcCWvUyPSKJ+Grf
	 A4d8ojs9xIet00nwydO67qx1UqqaM5yehIDnlknN86HIzt6i7g9Id5EVgFK1qdjf6Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIulHIam;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52ED606A31F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E52ED606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIulHIam
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so5378445e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588399; x=1793193199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
        b=tIulHIam1pcnbmL5Kq1kdTiV3W1axLfHu4Nw7F/nOOg1AbHj2CGUT6+yFMcT0fhP4k
         1H/49MNYKrzwUB7PNZe9WwYnNJlwH/aAjRWiidd0lAkc+TmMYr5gWVuYMGLsc6BqW/jI
         ohmXzIztd3Q5lnKzROcnCxk7rpvoi2AX5IH0aOpQ8F9F+PTok836+oF92hmZI4RIYL9c
         91iCOnAm3vifGyZ7DU7RHr/TO8ZBoAtaqrselCVL+6Sw45IklYzSjM5uwR4ogl1UQA56
         r7E7tMt+qnnZd+Sog1+FMG/+E23gzEI4AL4BOS2FB3KIo0wsT9E5CIo+ops+ht7vlzCp
         cYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588399; x=1793193199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=292nn4bD9cz6vKfwxdJIYuZQqNn1YltUeNe0zaIQXIg=;
        b=MOCm9YRm6AGOH8GiZs85lSNBB4Jqx3Q2mFT9SmB/7R/pgAmza8U+SvAsjfT69m4Vzn
         Dj9lXiQXVv/J34wPNdzjXV+LMIGajYwrY/nwDhCCad+lAsYvbsmwc33Wb24nlRBzsbIs
         T+z+0JHfViYLp0hjxXGXw09HVBTY7gS11JNa8JvTtcWzvhhJVtgqqwZkIa+6HDHR9Rk1
         wGgVjOHfjmjV/n3xDdlqnn19WfmZKEeeZfa4OdLJo60rctLQRKMyOYWd7USwKUXYZovH
         mrXvUf9i7KQ0m7uswq04l9nB5qv5crLJ/wtOpRhlmhXyYo1Ld+oO4C8Umwm9VGaGcO4O
         c6GA==
X-Forwarded-Encrypted: i=1; AKwUvBx83nhGzxwYVUm2AS1ZWXqIzGRhFifnwNSVx2xJMxfORqAcgDr0Fd8oeOMpgI/6eyLSWkyik0xkj6718WlsrCHOUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJp+kOl8cl1NqKUP93+cOcUBN16KSP/8WshNH6Z0RtA2v76as7V
	c+VI5uX6WbQb7/I7Al0YHya2SYndnfQKtKxDPjcHsczDwF22+nkWScoT
X-Gm-Gg: AYBFou1gPZsZeuskHBwynhar7kvrjv84WJfYoHTix0BoFJ9EyxCfwrjJVfueRYiq3rJ
	P3/aHnPoR5S4+FT85flmPl265vte1ooXT0pmZ5rSJjl2Z9MEqTq1NQWDL65cj/z6KoGlcd6GrhO
	6JZ7+tqKN39hdkHMYlh3lXZJQj6U0qOND8ArfREEfJ8MkeMdKaggxx15D5t5Hiz65K/QffqnTvN
	scDgoi+lmaIvoY5Zq1KHg//oW064qNNDhDydEZJiAn+pj56Lc6A4kQH/eAfD6TvOBTILT2Drmdj
	jPoeWp7YZIzCIHqoWsOVNrNVU6UG84BK/16sxSbJ60nxvwMRnoMbNO53+4Buck0TToKDqSt48iw
	SYil27LFJQxJoI0Py/SkpvxWDaGrlhA5214fZNd/VQc7MahskAgm/QR+8OFpoR8AYzka0/172pK
	1UZQ5N4NY8UNnpi0PJJRv06EaT49iWjL0DQIZ3H/WBRBl0dGabJecgpWdjm4W0alCUYdP12jxmL
	dqLD01Y98s3pdq/GPvsL0Am5stZTp3fsvyhYpe09J1jo1FRhfGpbHyohtDiXd00OrY86cYr2hU+
	gG78kSd5tgl8eJ28
X-Received: by 2002:a05:600d:82c1:b0:4a1:cdab:f5c4 with SMTP id 5b1f17b1804b1-4a1fdd24674mr41785685e9.5.1792588399034;
        Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:18 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:14 +0100
Subject: [PATCH v2 2/4] serial: sh-sci: Keep TX enabled on TEI while data
 is pending
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-g2ul_sci-v2-2-b4e038220018@bp.renesas.com>
References: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
In-Reply-To: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=4482;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=wf7d22n14z+6F4u/wCQpq1DvU71Byp9AVSJ1tL9JEOE=;
 b=3DOA93pFE4K6cXhopLwouumZlWA6bnQJ1hSGxktN3UZJKfjNgafV0q7xDKtLCmS9dl8I2yZJU
 l4btajxbEBlB8KGTpE5QoEvIERyfrHWYwz/D/jc4J96vrEZQwRfwEza
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

sci_tx_end_interrupt() handles the transmit-end interrupt (TEI) on
SCI and RSCI ports by clearing TE and TEIE, which turns the
transmitter off. It does this unconditionally, even if the xmit kfifo
was refilled, or an x_char was queued, after the last byte was written
to the data register and before TEI fired. The pending data is then not
sent until the transmitter is re-enabled, so output stalls or is lost.

Check for pending data (x_char, or a non-empty xmit kfifo on a port
that is not stopped) before shutting the transmitter down. If there is
any, clear TEIE, set TIE and hand over to sci_tx_interrupt() so
transmission continues normally. The existing TE/TEIE teardown path
only runs once nothing is left to send.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
---
 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 22 ++++++++++++++++++----
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..52638db7bbeb 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -627,6 +627,8 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.tie = CCR0_TIE,
+	.teie = CCR0_TEIE,
 };
 
 static const struct sci_port_params rsci_rzg3e_port_params = {
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 01ff9fced803..273856fbc20b 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -56,6 +56,8 @@ struct sci_port_params_bits {
 	unsigned int rxtx_enable;
 	unsigned int te_clear;
 	unsigned int poll_sent_bits;
+	unsigned int tie;
+	unsigned int teie;
 };
 
 struct sci_common_regs {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 9eb297dbc901..58120b523ca1 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -261,13 +261,17 @@ static bool sci_uart_earlycon_dev_probing;
 static const struct sci_port_params_bits sci_sci_port_params_bits = {
 	.rxtx_enable = SCSCR_RE | SCSCR_TE,
 	.te_clear = SCSCR_TE | SCSCR_TEIE,
-	.poll_sent_bits = SCI_TDRE | SCI_TEND
+	.poll_sent_bits = SCI_TDRE | SCI_TEND,
+	.tie = SCSCR_TIE,
+	.teie = SCSCR_TEIE
 };
 
 static const struct sci_port_params_bits sci_scif_port_params_bits = {
 	.rxtx_enable = SCSCR_RE | SCSCR_TE,
 	.te_clear = SCSCR_TE | SCSCR_TEIE,
-	.poll_sent_bits = SCIF_TDFE | SCIF_TEND
+	.poll_sent_bits = SCIF_TDFE | SCIF_TEND,
+	.tie = SCSCR_TIE,
+	.teie = SCSCR_TEIE
 };
 
 static const struct sci_common_regs sci_common_regs = {
@@ -2012,6 +2016,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
+	struct tty_port *tport = &port->state->port;
 	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
 	u32 ctrl;
@@ -2020,8 +2025,17 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 		return sci_tx_interrupt(irq, ptr);
 
 	uart_port_lock_irqsave(port, &flags);
-	ctrl = s->ops->read_reg(port, regs->control) &
-		~(s->params->param_bits->te_clear);
+	ctrl = s->ops->read_reg(port, regs->control);
+	if (port->x_char || (!kfifo_is_empty(&tport->xmit_fifo) &&
+			     !uart_tx_stopped(port))) {
+		ctrl &= ~(s->params->param_bits->teie);
+		ctrl |= s->params->param_bits->tie;
+		s->ops->write_reg(port, regs->control, ctrl);
+		uart_port_unlock_irqrestore(port, flags);
+		return sci_tx_interrupt(irq, ptr);
+	}
+
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 

-- 
2.43.0

