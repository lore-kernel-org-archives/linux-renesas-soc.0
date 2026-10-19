Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429309;
	b=jOXN5apgopTbzvqyADBPNf2iZuEy2K3UxkFFESoIvAD+F8zQnTiYT25AwQ4kmRUe8JUs
	 eIUJMXHPisPBKSM6Tz+9Nsp+3VRXoRURojULQPq8e+gaKT6e6GJwxzLOF+IMj05z8hszo
	 Cqj+phxxcrKHW+u4A94LvYUdTu1wcspnIbTcIU+A/rfA1DkaS2MkxRnWOx/gtAJKUpo5h
	 7f2/AIUxzmnFxDOpRDC4IiUkNqDXCeLBiVec9i7Y0D6nqlphravr4/2fpIziWpxtWlVZ/
	 sVCo8H84Zx+EJ5yR6v3n4x4xf43hKLDWC/ydMxKYzM56qrnLdQHg33+f1Z5zKNs2gsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X2JdP9uBFx29VsMFSt4MqnFpZC02U9gkSb2YVKNtlIY=;
	b=1bA8DV8s0M1hwKoOHfUrPQHVlWRfXuppDkCoHAPPo5ytzC50IykwusKO+HrBP3iP7ZsP
	 rFnT+aIBxsKPGOBW7c4g9X0MlSoyUa0dpW117L3dNqeN4LoP+qT54QuKsMLbjkn1gOY+K
	 wNR8rCIi3/3dfBY/uLxP8vkYH8oiS5TdHI0EkXDv5PTD77YySTgQZpPHhLSHRagHjWY1o
	 Av1rnf5zTznKw7ojbYEh1L3RX4dDKZJMSmMEP3L3UZReNAP3lMWKHXeAmMGUrtW2TR/TQ
	 ZPlM6hJiRfPRt1GdqU/29tEQ1HKypbG18xB99uzYpDHlV8hY0fPdcv3UW4nek4VI+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R7MpN+SO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C0606A338
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 17:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2C0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R7MpN+SO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1541151f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 10:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429307; x=1793034107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2JdP9uBFx29VsMFSt4MqnFpZC02U9gkSb2YVKNtlIY=;
        b=R7MpN+SOvxv5O57TUMwFOBF8ZHJg0a6mzHs0MBsBUbSULF+iGZOtcbk+j/eXs6zsuv
         hAR6+OGJmLnHKp6FMvn2AHiBP8MtNleMcaU1E5sPdR8ah6xb+azuVQRBY73gyJ4oRLY7
         FzoR3WQpH2DQKmurzzQhDG02AZCtIKY3mFsOYZW5c6HuBbJqbqBwCbKYxnd4ETXIZvco
         1t/YRaNDGw81TWg0q6XxcDdXbZgqgNq1gC/Gp7M74OObKUJJrkzCRP6cwewziqH0FQcE
         yLqaUI7fZFopdsx5AdX9DrKrhxec1Y9qKkYKvz6V4bsWG1G8NCOBo7g4rs4W81Jsr5fY
         aJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429307; x=1793034107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2JdP9uBFx29VsMFSt4MqnFpZC02U9gkSb2YVKNtlIY=;
        b=Rc5TRshSu/aD+xNvbFx+6m3fN4zrbArsqRR2Xh7akpI7Kb4bupbewRrq5QDh8bDBnz
         eeAsqXYA9HRxwgscVG+nwmJzrrEwWHKCHXi5AmJfeekG1TiGnaoSXfu5URebYdSfeL0y
         JamoTmWq1Rkf9MtHhoZBfn+2q21qMaU9Oo3AsedbZWJ4G6Pw3dZHtI/BXn4DJTQyUL6M
         HYhh+5SquWaszew533yFJF09y/uOsvc98NYdY9OBm4LVmncVMyaG5NIsoY+1bz3yuM5+
         neMjLS1QgtwEbvD37waC5eB6kOag3PEB3SLqLpSBujOc4RdZW8LamWy4UY/RNkawh66c
         nBKQ==
X-Forwarded-Encrypted: i=1; AKwUvByLfDnLVulGDJ/9niAhOmCD7kB49uqEW/kmf4A/i/pqkZ/ogoJ+vIMhMUhBSz7crJmPsURcS+hAdRZXThr5FUjF1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtw6exgj6GLxbf/KiktTdsoaU2HFY2Qj/No4jNCcGVH7iEVnVp
	XmXDcGEEzaRE1qRJavqx4LYIdjGCiacd2UuwflkJez1L8tnPCMA+BNdy
X-Gm-Gg: AYBFou1R5K64fjaB8FAn9xSjyA6e4HZIzcffGeFauLFGHQoHGMj9qyONgDc4tCLtrLa
	/kiU05uiy3gczA4ccfWsDp2qOelwWzVjeT3Ier7l6GOrqu4jUXnmHvcowVQg26zQFkZisZBVyQX
	LN5RS2gOPtK/qlwnPJxVaW+vfgfh2RI+ElrBTlcl2FvQF76hGQ9PeZnCiskLUIe6A3lw9kPb3Jz
	K1nz8fPYdP6znDfzTnhW2k8EaGovnZbopuYs6PcVD8wcZNsauFAE5Df0zPFC6zjKalRIUH+/I+E
	qqhIGmioRyJF6oCRbgjgLcKW4Vaewtl1ioAAZkx4Vsnl180gmKCY90uQkBIQAtdFt6fXsZIFMTw
	idxKWqlYw3XQNuPyUHK/WVDpBeWnPUMgGgwS5WOe80apIsK/HAOI2oeBELIjTb0C2PlZ5I8iU8k
	U53qKNBDobJNdm3dCI1oIn94U4Pww4fJZVUPCwz3tX+0ar2ouwbZL5wyS2+r4/YRTYRZHFX0CC0
	ip3kbLP8pF06nnMPPrTBq7onlPk4P1hASsINfPa8DGKhiWzxr/yQ9gx
X-Received: by 2002:a05:6000:4a1e:b0:487:88b:4681 with SMTP id ffacd0b85a97d-48e07bbc7b4mr18155599f8f.10.1792429306635;
        Mon, 19 Oct 2026 10:01:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Au Dang <au.dang.jx@renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: =?UTF-8?q?=5BPATCH=202/4=5D=20serial=3A=20sh-sci=3A=20Don=E2=80=99t=20disable=20TX=20on=20TEI=20while=20the=20xmit=20kfifo=20still=20holds=20data?=
Date: Mon, 19 Oct 2026 18:01:10 +0100
Message-ID: <20261019170139.473808-3-biju.das.jz@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

sci_tx_end_interrupt() handles the transmit-end interrupt (TEI) on
SCI and RSCI ports by clearing TE and TEIE, which turns the
transmitter off. It does this unconditionally, even if the xmit kfifo
was refilled after the last byte was written to the data register and
before TEI fired. The queued data is then not sent until the
transmitter is re-enabled, so output stalls or is lost.

Check whether the xmit kfifo is empty before shutting the transmitter
down. If data is still queued, clear TEIE, set TIE and hand over to
sci_tx_interrupt() so transmission continues normally. The existing
TE/TEIE teardown path only runs once the kfifo is drained.

To keep the handler independent of the register layout, add tie and
teie masks to struct sci_port_params_bits and populate them for the
SCI, SCIF and RSCI variants.

Fixes: d61ae331d6f3 ("tty: serial: sh-sci: Add support for tx end interrupt handling")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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
index 9eb297dbc901..d577f9de6259 100644
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
@@ -2019,9 +2024,18 @@ static irqreturn_t sci_tx_end_interrupt(int irq, void *ptr)
 	if (s->type != PORT_SCI && !sci_is_rsci_type(s->type))
 		return sci_tx_interrupt(irq, ptr);
 
+	ctrl = s->ops->read_reg(port, regs->control);
+	if (!kfifo_is_empty(&tport->xmit_fifo)) {
+		uart_port_lock_irqsave(port, &flags);
+		ctrl &= ~(s->params->param_bits->teie);
+		ctrl |= s->params->param_bits->tie;
+		s->ops->write_reg(port, regs->control, ctrl);
+		uart_port_unlock_irqrestore(port, flags);
+		return sci_tx_interrupt(irq, ptr);
+	}
+
 	uart_port_lock_irqsave(port, &flags);
-	ctrl = s->ops->read_reg(port, regs->control) &
-		~(s->params->param_bits->te_clear);
+	ctrl &= ~(s->params->param_bits->te_clear);
 	s->ops->write_reg(port, regs->control, ctrl);
 	uart_port_unlock_irqrestore(port, flags);
 
-- 
2.43.0

