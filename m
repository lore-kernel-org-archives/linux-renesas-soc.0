Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013821;
	b=aeqeU9ARUBdWYNUOVCNYNyyp+MT+N7aDxFTTcB78i/8QhOJ/w0UKlIR/UUoTBoVKjben
	 9IkpBJUDTeRvuBQb6kwVsY2lyVYpMuZSTXcTupnTkxSPGvJoa885aAqpOLsZ2KClBAlE0
	 tFBXWQDaHj3W3xeKA+c6Dv0SMlqL4Gb9z0/HjYHCuvotpdcvLK3LDgnqVbg0EiB6GIA4t
	 pJNLQjP7jpJBf96jU3+eIHs5JQKjoR21ctHSpPhGqoG2+Y1+3rhOk16TqBw5OPIm7M85u
	 uZh7j+EHvAJRt7YCqPFrkMzjEU8YoIzcVigq8gUhzr6nsCkvur/2WCbuQe15dcNs7eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
	b=0UuTfTEVgMGPQFhuzWRajdNKv8HEoyXzO3xOUxFFrDONE3Xx9et2y/LCuoi34QRN8fli
	 X2qctIiPxXVzvVAFqvDfBGtBG3Qzk9B8J9Jws8F2LSTSmHi4pwOGWeyEbSOvnDpNmB4ud
	 om9hHkYFE5fgZBW5hSWJVBvgC3qGKtAeJfJiKdMYybLRuuIR2LvsLnmaa4jUQg7mU3ZxR
	 2dc5j2rTpwSBz6qTw2LzM9MQwhK9COd1tLyY4/hQHEqI9cvVUx3PewJ13jHrlLTkyhccL
	 jSlH1oOkNAwORSC9Po+PQ7HKGTs6xfL5j695UQUlWib8Odl7euCIcreLj2WRSVCrqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Eb4ZJMaB;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8572A60A2610
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8572A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Eb4ZJMaB
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2144470f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013819; x=1793618619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
        b=Eb4ZJMaBS/j/18Xff5SSSRLSO5m6c+4/yCdP3mEudBGbGe0vsqOFOrIakXk+ZZFbtz
         bASIbgpQ85FzN6gTp29PdM2T5m4LgojqERS15a0rKdDblaNtD1HD9h2D3lvGrVUfjSU0
         U0MUaWvl2nU0csnzoStmK8OgsTZCJ4rVb3voknZrepPZyYnbt5yTfQTW0yoAcp2Q2AY+
         +D1exgXkc/WNy2+osYudTY+UmemK/L1e+u4xC11CrnVnWIF+QfaBEGDDp2uPNOX6cSbD
         qeHcAg3Motw6CCIfyPngFiG5gvBxKRtqwAyVh32LBNIQ2J9p3PTbQVcXpwhu2QU3GABD
         Ikvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013819; x=1793618619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91CxdySFaB5DrN/6er6Cmr6Afr/bZ+u4IgV5MCTNg5A=;
        b=SC13QpFPq9/92WuXAxjC7yzDCVtJROu25B6x8wM6TlAcIQdQRt9zoov6zXWFyaN+Xr
         YO10jrYyxdc4eUtzaYCillrNzL2GPyLwQAH1eoRXZEDSPxDM8kKUPmnQjccS5khXcPE4
         Jkx0DxTo2hr1I+/PK5M6oK+inmE46L9KR1Q76nbih6ZzmlX6LLKWbh19EDffw2kNIi4m
         P0xcSqnH39YGCFnMrwM5G72BPVLdAikPCOSvDJ9rMEmmbbnMmCoYVOQMjVtw28fMNoxC
         8WTdi+uITbtj0BvZG3mXqmHGB1on/3xFTKciP443/WDj9akZ7fQnYhwHcw1Yg5s5A6Wr
         Y2uw==
X-Forwarded-Encrypted: i=1; AKwUvBzeC1+TmgSvw9VvFSzvYZ7LFevlW+BdBBcmG6B9Ae9gaOZ+MAx4HrBJsy2PHFpHVlzzjUowlEiM58gBiGfA5RlLDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYII6BqOmMlGEeRjFkEloEJblZQOoamIlFBy25GqhdUdhk8eG5Hk
	lG393dusm4FVsoScR4YF1LAfyefCEuySu64TRG7Uy1NrSXyOkKybdcHA
X-Gm-Gg: AYBFou1PouMMi53vyv7b/0r2DM1RT13Vn7yPsh/JpbVNICecKcKCzV1Xb0vftRwecHL
	Oi/pMrkxKH2YQYKDW/hSQzTEtVRbd000urGNMU1DnNrhXayBwsKzblLGm2lz/LmCZGUE3BEq23e
	cQHr/7XMRTvkm4nLiJL9TWAz2O4AqhVqeU8vvTK01gA5bPMfxR9dPcQSQ5V3yCvFfYRRhm0ltBe
	NXdhXq6xOADZ94Y9l5huo5hVIYgiVe4h+NDJKNspcUbIH7stoDSFKXLRODZECyl11WsQgyb2Pnk
	uWTyfRhINx6z4BAtn93ZAopIE7O1FGK+zRrEu9a4oYcmv2MToCoYHo/eC4tvNYLAO1S3t1AfM6r
	AR3gTIGRHFQYwJTnIkKZ1nV+6bHNmotjh3D6VFFENWrsNWW8ionKSAZYk1UIsKzd9utGRAx84ze
	dqGTOZ638QsFVHiycBDBcvHuNcuAeI1ALsp713zCzQhGSxj5ScMFNEcDT3yuhD/JHf2pL+5dr7r
	0VDGoOOfg4W/6cb2dye/y5wjWI01kyBE6wvQ04dINau/cH3xCmTEHqenHlUMbVmyvC+AGYpqgC3
	fErrhniDswmLLwcy4Q==
X-Received: by 2002:a05:6000:2999:20b0:48e:d57:9bad with SMTP id ffacd0b85a97d-48e3eb4593amr8523490f8f.3.1793013818741;
        Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:38 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:34 +0000
Subject: [PATCH v3 2/4] serial: sh-sci: Keep TX enabled on TEI while data
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
Message-Id: <20261026-g2ul_sci-v3-2-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=6886;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=qboa2rwoVt+GqKOS/MAhP42f7309eks4Yo8BKQfQrOI=;
 b=z2Hmp1XHW0PLOLrHLhw+d3/pu5mIslrFsUqLU733cT5JadIPoyW3PDYEpzDLi112BpgJaLQA8
 eF/KVqFvXmNDe1mXlYfXOeqb8UYBj6gn5gD1HJP5WA5h+GV6a6aP5Dn
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
any, clear TEIE, set TIE and hand over to the port's transmit_chars()
op so transmission continues normally. The existing TE/TEIE teardown
path only runs once nothing is left to send.

When the port is stopped with data still queued, the transmit_chars()
paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
would keep firing with nothing the driver is allowed to send, and TEI
would never be raised to complete the transmission.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit description
 * When the port is stopped with data still queued, the transmit_chars()
   paths (sci_transmit_chars() and rsci_transmit_chars()) now also swap
   TIE for TEIE, as they already did for an empty kfifo. Without this, TIE
   would keep firing with nothing the driver is allowed to send, and TEI
   would never be raised to complete the transmission.
 * Replaced sci_tx_interrupt() with port's transmit_chars() to avoid
   lock drop race in sci_tx_end_interrupt() before TX handoff.
v1->v2:
 * Updated commit header and description.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
---
 drivers/tty/serial/rsci.c          |  4 +++-
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 47 +++++++++++++++++++++++++++++---------
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 40db9daa4272..0391111db8ae 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -465,7 +465,7 @@ static void rsci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 
-	if (kfifo_is_empty(&tport->xmit_fifo)) {
+	if (kfifo_is_empty(&tport->xmit_fifo) || stopped) {
 		ctrl = rsci_serial_in(port, CCR0);
 		ctrl &= ~CCR0_TIE;
 		ctrl |= CCR0_TEIE;
@@ -627,6 +627,8 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.tie = CCR0_TIE,
+	.teie = CCR0_TEIE
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
index 9eb297dbc901..6df25fef5a5f 100644
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
@@ -1007,6 +1011,20 @@ static int sci_rxfill(struct uart_port *port)
  *                   the interrupt related routines                       *
  * ********************************************************************** */
 
+static void sci_clr_tie_set_teie(struct uart_port *port)
+{
+	struct sci_port *s = to_sci_port(port);
+	unsigned short ctrl;
+
+	if (s->type != PORT_SCI)
+		return;
+
+	ctrl = sci_serial_in(port, SCSCR);
+	ctrl &= ~SCSCR_TIE;
+	ctrl |= SCSCR_TEIE;
+	sci_serial_out(port, SCSCR, ctrl);
+}
+
 static void sci_transmit_chars(struct uart_port *port)
 {
 	struct tty_port *tport = &port->state->port;
@@ -1050,14 +1068,10 @@ static void sci_transmit_chars(struct uart_port *port)
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
 	if (kfifo_is_empty(&tport->xmit_fifo)) {
-		if (s->type == PORT_SCI) {
-			ctrl = sci_serial_in(port, SCSCR);
-			ctrl &= ~SCSCR_TIE;
-			ctrl |= SCSCR_TEIE;
-			sci_serial_out(port, SCSCR, ctrl);
-		}
-
+		sci_clr_tie_set_teie(port);
 		sci_stop_tx(port);
+	} else if (stopped) {
+		sci_clr_tie_set_teie(port);
 	}
 }
 
@@ -2012,6 +2026,7 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 {
 	struct uart_port *port = ptr;
 	struct sci_port *s = to_sci_port(port);
+	struct tty_port *tport = &port->state->port;
 	const struct sci_common_regs *regs = s->params->common_regs;
 	unsigned long flags;
 	u32 ctrl;
@@ -2020,8 +2035,18 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
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
+		s->ops->transmit_chars(port);
+		uart_port_unlock_irqrestore(port, flags);
+		return IRQ_HANDLED;
+	}
+
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 

-- 
2.43.0

