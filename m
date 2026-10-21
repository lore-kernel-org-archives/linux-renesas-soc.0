Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588399;
	b=mwQcGKj4h0qkaMmIcaQxLUXPUCBpzX9siT6/3OcKXJXAC8VqDIZN3ol0yABHqlw4qOGd
	 kPVRK0mrxrXdVtSwNIioyb2XH2f+9PtknLH6YHaqx/wnTuC4oef00oU/bvaoyKj64ECuD
	 Wh8AKrrQKnOs55VDDuRQsOMfokpvvt4137wy02FrZqcawV4KFoTDCjgs/7cgwMJPpuDKs
	 XUo5I7+c6UbJNKoQ2hSs7zQ+IgVBSDy2FkdQWVEdi4CgoGXSmtxD6EkPwJjAVa3UD5biI
	 5CPujVNM/RkgZGa+4ATMZemDFL2+9QsCsh5pU6YfP5TBXBgyHdnltD40Bals059QtfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
	b=noAj/ymhEnIIYlNwdAtygqt5VR9z9Qd+/JcBt3LHxq/NZLTBzTAQqeqGoGisqVTpF91F
	 mXbuBcT0r9pLVTh8uS9C3qkwal6bxCvcz/pWdUqWDnEv6RgsyOFmrndvsWZfOAoMU4nIk
	 O8pynxgVJPuvy/2J1SWSs0kH9oApla+yum4atZxyo26hOPSwTNDY+gpYHMsdbdCZ2L0En
	 wmTullims+/APsuKb6E9kYUcr3LsYJhUIwdlNozrhBJx2H758ok/zwMh9yPS8tTPxDHav
	 xZNBns9AQkiO3H8VoWx/VMeaR8xrK3qyvn6+vLlaIqX1m/tIJrI4UWcgJ1M+Nf+zfgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCEmyVSw;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA84606A324
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 13:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCEmyVSw
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df54150dfso452507f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588398; x=1793193198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
        b=FCEmyVSwyMIhgeTMCMdf9r23TjhNj0veKXSrM/ESw4hf4Bz7ZIqD1y8TaEBp44tsoP
         yRgWBIUPNTqNe8io8dF2Vv/JsYPX+h8UkBnn/pt7yV5z743+FGCRp89YZrZvfUoE9TZh
         8PlaYsq2kAvy9foYDpeD5OHutjRLZbCax4NToL+sI0DJYrmhPV2TvrHMoBvAHmn6DfnR
         9jWSOLCzWyT4SP8kWpzb/+q/rj7xtIf5tuJ8/VmA+MN9kvyJG09eQztgLD8TOihfKOM4
         qH3gqr0qt3XyfFJ4XJPa8aVIgpPxKl8eSlcvlUTGPSJE4GG3gZtaJfZoCo23ocXN+Ktp
         7KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588398; x=1793193198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhDg8QClMZJOayDv8bj/xO5vbSdeZvK1hnpn/RI7Gj0=;
        b=mW7GQtVwcnJUqMKcS8DgVC7OjfW58LaZxJ4RGnqXOFDA0VJ0kDJoO/iJmxwV41IPsx
         y1Z1/miytydlGiDmWrS3Ie4GboVfv2whC0VSGFd7eQTD7tpHioM+1bK537x5e1DugEOQ
         iwqMKMluH1KOpHBy68k8TPF2GLRFgMZlpW0THK50kiOwTnCQJi/fWh4wVUPN7qXUhutw
         qyrdri/NKIpOjTzgAufaR20vc7pHZZDsAmuAGoCh+dJwRIBUZ48z8srjDCNuFjr5e8S7
         /jf2jDrxtoRdq64IzdmUnNiaRcC0aRI3IIcRjunnPI8mlH5HrJqi9kpTcGQVURUtZt0d
         6KWQ==
X-Forwarded-Encrypted: i=1; AKwUvByYb/0y+i1Kwwgsdt21KSW4OpYfLlAhknG8rPTP0WU0nMJE7YJYenR2v1UMzIRAV7kqwhQ/xxAkYePKDcixgjFCUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJaCFi2XsN2D/vSJmUlLM2/yVb/L6mv57o6JPBWAhT1i6EyyqrJ
	JubdNYDAXc/Q8A5EK/M1cHsCsdh6zOhIXtA7h7F00CG7j5w7nmjlnrx9
X-Gm-Gg: AYBFou0fdB/ZNDE17xz3mpK8ErooBMdiYbqj9jTAlzPYkLv3KzKqVdG2lz0Zv8P5HWQ
	zzHiRHoMOg5ZtHXoCq1G3JiX01iHlK5QcfNfJtphVIYkWb/fOYGAzX0EARgjnNK/IpCD/er7eGy
	XOTM8VUd6Qh6VDA5g4TV4CdUv0Tk+G+lMV6VM/SGubKYe7FhzRbhnFwy6zw/i0oLAyUfZ9mdX9I
	Fwt24H0kxMH36PQCXmJInZwlG9NRpzb509bpNWcYlkAqnsTx1EqAhh3sxlv0ejgMA2d/EpxznX8
	xN94sz2+h9AdG6A3Xv8e/MmZG1YpzBxPXrQskZFBZGeb5QqeCLb/8IedsKw53hlBK+Dokcvn9oH
	nHVrfAIYbB/HXeJry/olspADZCxDaReQo9kvFWCDLCF7bq/dv1Eww56zDcbn9gGZwdFMZ9X9kZf
	EYUgFYSxTU7qYZoHX0HNxILstfJ8SFDgNTbpRApnGg0va3HWe6lrtf20vHQ5HkF6dkQXtN5LT9k
	zwOBM0ZaJAUSMjUhclOlZPWAJnPtiLrindBySfyhSao0/J7XG/Z3p3WuEFL4N4+iqh2jJ/wNy29
	QJs5DeYPJFOnBf22
X-Received: by 2002:a05:6000:178d:b0:48e:b8f:f7d9 with SMTP id ffacd0b85a97d-48e2644eba3mr4823249f8f.6.1792588397791;
        Wed, 21 Oct 2026 06:13:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:17 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 21 Oct 2026 14:13:13 +0100
Subject: [PATCH v2 1/4] serial: sh-sci: Drop TE disable at end of
 transmission on SCI
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
Message-Id: <20261021-g2ul_sci-v2-1-b4e038220018@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=1377;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=3weoth6w6Xdl5b6WOfiDQxw3Mye7WCDgh2tqKrLoXnc=;
 b=pfNldyHMgPcqhzkFa1o+cms2Op0v6z0MqVAr8fWkcLhT21/2XnwoWjrKs6qWVj5+gpFwTXWbJ
 sRDd6avqjMtA8nT5XfTmxuB80Ps12Jq+DvQdSjgwz9YuPZJv0R/r4sM
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

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
v1->v2:
 * No change.
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

