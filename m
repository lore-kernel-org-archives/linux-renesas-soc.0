Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013819;
	b=YMAPzP8kvqNep9evkOKFFlqGnmpoiusEIV+o7FOdzQWGirr6dObnpTV2/dn1eqATsgSo
	 sCigMWL6Whkn17mE4VqEn4tedRkGMB3wjhPkF0Em6kxLifF7BwPZPICMoS25X2s1QQtSN
	 WS29tfbcfeyKJv8ZvQmkOBWvQtMwA+6kzld5MmXR2rnKAy5Qe7yC3WsvbCfHMBi35JUwo
	 tSHO3cY0jF1xsJPc4YEzLPOkDOiNybWCL0vSFxdc+mDrBVESaaCIY0SoEBKU4IOe+its8
	 RUf33yr4QkMRrx7NcGl0+0TSm8RZIRHGdSeXitbnzyr/4qopMdFoNa5QH8vhaddrdEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
	b=D0x0zcqCC2Qekiem+VrGzwf38COHNptqYBVkZrgGAsBVbTCzY8Z/Eh9QHMWRrEmd8sp5
	 ONMUKtdF2g7GpWyeiAn09gmX0FobLf8g2WBtVEqvRgO6fyasfKwmaAcXGh4zA87HhSUpW
	 +aO7qC/F7bkWju6NgnGODHFA1h6ftneGE+1qT7WsYMl37rgVFnBqanjIsmw7zvB1t+5b1
	 KziYWjHghqGkdUKZOOkXhe1IPdFAnq/f5xq980tKd3XEbMpSV4JKGtR5iSNtzj6LraAFt
	 z0BS5vyZnQ1z3l5gr0kq3HC78cNPhLqL7yaYugNhdGEuKfPkGV6GEQnp4X8mw9ElHeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ggtyAlK5;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75210606A336
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75210606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ggtyAlK5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so5341175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013818; x=1793618618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
        b=ggtyAlK5d+ZGKZ2b0k2afzMY/YeLK5gUpsHdBkcfs2+quVkigOVOMhTvVD3MfyY+VJ
         RhWb0GBZLYPua1DoXaoxKgGc2mSi31SO0cai/wzdMHK8Sk+AsYOAjQAbAJrFBHgNXPct
         +WSBhk5OEc2o/k2cdeUYmIxwWVx5yRyuZCb/iUXXPTvltGSiXphRVfmRpREcKSBpVOyL
         t9XKQYzKdTjGhCLZVMd/m2wOxMmIcHHe0pPn5GKumaBo3q+rCRc5KFV7C7lSMFMkftcq
         iKNFgnH40VRzdUTnx8O80viDLN0VAhj568VfjBtf52NiBLYkdXyrDfOAtB9vtFKgcfDA
         PJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013818; x=1793618618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hi7Sr5AhOZnPq35jxQMZKgyIjGd6gqHdfbAHtpf8ZRc=;
        b=e3SpB6ij70MkURvVGw7LvTIZYGJUipxGVO0Fn33PldQHnIhi0HQVCMC1WZYA5pSQZR
         /7sisIgWjp+eF1mGKr3p29r9dr2TjgLx/gqYqw+HjjYeyKK1pm++nw3bddi6ttXq+FGQ
         D+i7EFfLvOWnKi0k6FVDRE2yKC+q0HEQle60ESz1qINDcucMPJE2+LJV5pIzS5nLzgw4
         mMNIlxFQpze/sygQ7U4M5gPVeRXZkm/QFQ+EL287vbED4NOSm+R0KxNT/E3L6VYOnYzF
         pK8+n9diAzZVr5+mt7ZoAcQJGTMdEB6QpQk3DoKBTmyIPpF+nwIHVYCvey6b6d1KYeS1
         nVZg==
X-Forwarded-Encrypted: i=1; AKwUvBxTzYsBKLsi8r5JZJDab8z+u+5o1eOXNMrMHONf+oh9wzEAN6BKPvUCqqRpVoBO6yWNc6AxYjwned/+lty/IQi0zg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZsHckbeVLUQ2PJhIIaqkN3HgSNMeVzI0yG2yDCWfCU5uWopNn
	Os4cAceO/qkrti2ykx0Ymw4JNA0P7we1pRptsSkWQmcYl3ZNaPJP1LBa
X-Gm-Gg: AYBFou14Uj0NXqqCU5QvtP0anhKGMGRygxGFlc0vSxVMwLD/0Secjem2E/3vNLAmM2P
	99euMTJKCjPBQsmnCD0F0p1Er7YvWUZ6zaVLHC8mshTYITaTbV2vo6UvPlSculP5gK3chdapnEx
	D/G2y5K+o6OMMonOPdX0/Mu12R6FnLTLHLyOQU9vNm2Q9OMhn5L0dG7ri+jjxbNVvsD3SC+d3Ao
	MkMcwOKDLxBQS2DJOz6Xre+FP6ZJl0ax/n4wFp7goRfx54LPkYQ7E+ERgkUPsyD6DQhc08oWUBN
	XQqayHusYq3OYdPIFuu8Lya7bj79y08zINeDDT1Bc5emLPsUf80YcQg+ja9AFXqp6xuSVS+t9BY
	WoBHhNaX0WlFOEJRxr0WBL0CkTzSuN4SgzRdrrPeRWnTbX55nCsSqkL0VNzy6Do3ikdAeyW829B
	F3hDtaW3TiN43xtVB3gZjQQ6ebrkLsX14iHcTS6/tjjv96OUFIWAGw8/2/OTwB8SBAX+Ow0gCRX
	NXhTLNbBERTsWG4JHxyCcJLa8WaJ08NT3IN2A02qrh/zlr1bdazKR1GRBpVlxBl28C5nIiLnYK3
	NwPXsRUjBhLBuaU6XME=
X-Received: by 2002:a05:600c:80ca:b0:4a2:5ef:1400 with SMTP id 5b1f17b1804b1-4a35ac9a7a3mr79652025e9.12.1793013817664;
        Mon, 26 Oct 2026 04:23:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:37 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:33 +0000
Subject: [PATCH v3 1/4] serial: sh-sci: Drop TE disable at end of
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
Message-Id: <20261026-g2ul_sci-v3-1-b3097163edd5@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=1401;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Ii4p8OHUuRr+409dJC7XNZ8wHyl0UhxZWbqcu7AjCfM=;
 b=QPOwAoyUkoWS9Bqp2w2X70DfqejfizPDZXdsQkJEafZxIQD29eClU0HtB39i56Y/RJtVqGMco
 7idJP3hdNJxB+CdRDa70bI2O2JYk8pvtPqPW2OopCkZ4Ge+olw0piyX
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
v2->v3:
 * No change.
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

