Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013823;
	b=i2HeX+VqwyQjKg22EBE1C5qucnl2zQofL0Rrx7U0fq0HMoNxJ0x9iNCAqmzVBoLfiqaD
	 fkHs+MZDmUOHS+Gx+MnYst7Go+SzdOx7/eXcylRHd7x1qXRcKFswNeOc+q754bQZlxIhD
	 EluTiQi+QWvcrYBkROsDEvt9yX5hEaGYeSviySGVMUIA0rRRYPC0vQfR3ufDtizo+Izbp
	 XP776BeyIyQG23qYGCMpBbompwOsIQH7fyePlsNXrGVC6kgx8ghPxVWFIF5jyvXH1XXkJ
	 N14rAJLDtcpmeReQi/LAOaB+IDF1X1tm9392OTi6aOQ2D8QxO6H3LEf5HqrCP2gJUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZVnVrRYLB+qKKrukA39OJ5KX7KFcwt/Dh/drOtJ/Eyo=;
	b=Ov8kHU2IkNKDFSi02FmErCUyDGqzEdfEHUTycNmo0JnxfKsZbPHmaJhhncfTgtsPYC6p
	 wZXYD0an4ly8wFymMxXRrjtBeT6jGVgrXhlXBJtlQ+C2eqrGMBmvFyplTTQ2+/lTkzEFF
	 87mYSlvVAHmxGfgCdtlLH1zBMfyIcRv2KgaO9MgODcHJvH0X1ioSbwILFvdD47jLTIEXY
	 ScJxAk4KZzjaoZjO7nq5mJECbTu+iEntr2ZdF0N6swSKHln8wvN+nLE8TECgb05njgE2w
	 PEByAmgKhIv0M6fPwzfjdzZoWbH962FTV39yO2OBn64NAfjbdOtaaXss0Hsy/PQPlhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iDTtyrE9;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243B60A260F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5243B60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iDTtyrE9
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1674901f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013821; x=1793618621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVnVrRYLB+qKKrukA39OJ5KX7KFcwt/Dh/drOtJ/Eyo=;
        b=iDTtyrE9BVqqKPSXE4cXO8eADEeCatz8AddAjfjI/JB/R7KGCfZeodzaZwAlz34hXl
         l0UAS4jSeak3Yvm1K5KWk0aDOJO/WC6D+AQnWVSt/P8ccuf+2FTLlDJ76zxoUo733Ep/
         IeMQRF5OcIClCU0e9RldG3qDyKXb7mw5dWiVv+2pIJLJihFIxtuGVK5b1q4/amsyH7Xn
         gyLvD+5zjPO4HIrzWY5TYn6QYRy2PaD5o1BJU++JZ7s94zcCT0moJ6Dd5YY44TJU3nRj
         hqzsJ4GZxThKOIG63XI5Ks5RKAFcYCzFpdoNYc72BuvdBPP3+mWrBMxLEq20phZq1MB8
         g84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013821; x=1793618621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVnVrRYLB+qKKrukA39OJ5KX7KFcwt/Dh/drOtJ/Eyo=;
        b=wtiMyJdzfgzdcJsBhcY1SebD8xRRROPAn1YYueEAdZDO4gquxAoX5e5nDsPZhBRmKK
         hcjngjIiU1xxR/awJSp//pz/FC7VQ8wvpotiJZERyHq+F9FnRnaggWUxXMHWTu4iwuy5
         1GhkoKbevmECi/4glXGJggeVVeD7EMWhM25ijrZCihTqkWGkCEEXdbLL5uKX35JoAfcw
         5Tb3NiR3iaclxuu52TvQ9nH0Nj4Ug/r2llTKeD3VWnIqQBHBl8+X7OZNc0p1iWzMuU2X
         MRUn4t7zCOm0B3BoUt142+aWG++XlGoZNtMFfXaTnSzl7NlgKU6CMpJW7HRKSAeJxA3a
         +v9A==
X-Forwarded-Encrypted: i=1; AKwUvBynFP2Gn5g/jWZF7MQQxhJ/+YxynEvmC8F7abBKt/hASs5FqE39bVv9AhP9eTo/e0/csoAmNX+E/lHyjNSqATH44g==@vger.kernel.org
X-Gm-Message-State: AFq9FYINL6OXUfvqdv1lArxdqNK3qKtguXhpdfHxOKfY6iduYOi7x11R
	P0k8lBxTAPg/BXzqs/ThmiPFxao/vidkQQutUdCLy8mjFdefO0G5y9Wv9HOU4g==
X-Gm-Gg: AYBFou3MxANPhQdb5W71gdsTNnVQThCC0aegYIym5wGWBNgbflg3qpFw65NuPIPcRFH
	oTcC974oR1V8iIscplqdGvl6XDvx7adtl0fCOD8J1JE++6QKFgAvS8POBYteaiKQe72vU5S8kYL
	eAuATOHc98eqrJuOkfp2AtMtJDC5YX3ymSvxuPHmPIqnaoTmvMo5HP/FRnM1eD/F4gkvFRElPBE
	WgU8IavHnfLXZeAE+BuwTwKfvRRaEFerHnJo57aVDaGuY3dQbEC6lYPCBZSf8RKkn9pQCLE1dqo
	1Vvb1kRt13wrOHKmO8UJXkMZSaKdqtilesaqtRxry0q0wte7YWWBu+w8ZpbhCMviCRote4w92mp
	bmiPvVjw8k7bw35ptIH8Cfk/pklVQCjwu4SPxtm7b+xKuJpEYM2pKsqYC7b9kUq0pDwX9fE2Jcx
	bAriFUoTmLHBrIBpz9vqYJYKmxHUx4RaTKEBcjtErvyQ1Hb8jFYPnuLRNIQhdck9qNROP5cLyav
	SZLW5FTkgRjoDUDwraTfdrNluRk07ROtcmhmHssfHhzP8cXGCv5QuA8668JjoGZ6E6m3mIzyCzg
	yjzs2RADH/FTkmOa7cpRQfIBLpSKtLO7EYu3SAc=
X-Received: by 2002:a05:6000:2408:b0:48d:f5e7:bb77 with SMTP id ffacd0b85a97d-48e3eab5a61mr14950329f8f.0.1793013820776;
        Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:482f:657c:9770:475e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm15959263f8f.54.2026.10.26.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:23:40 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 26 Oct 2026 11:23:36 +0000
Subject: [PATCH v3 4/4] serial: sh-sci: Toggle TE when restoring SCSCR in
 console write on SCI
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
Message-Id: <20261026-g2ul_sci-v3-4-b3097163edd5@bp.renesas.com>
References: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
In-Reply-To: <20261026-g2ul_sci-v3-0-b3097163edd5@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793013815; l=2314;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=05m98a4wCXyibckYyionDlpRiTiYXuxhqxZ1PhGSbGg=;
 b=bKAOy583UIZlEm+R8TR5tzfEPZMqzZolU5PmQM9oM2xSnSvxn5og0ZRbtXW+xozXhpatxmnaV
 xcrrVCu8raAAVgRgpEfD7LcDkqXrqE9q9R84hWIaIqRheB6OTl6ciuw
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

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
v2->v3:
 * Replaced to_sci_port(port)->type with sci_port->type in
   serial_console_write().
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 1a4d9467d2be..35a2f721bf56 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3456,10 +3456,14 @@ static void serial_console_write(struct console *co, const char *s,
 		cpu_relax();
 
 	/* restore the SCSCR */
-	if (sci_port->ops->finish_console_write)
+	if (sci_port->ops->finish_console_write) {
 		sci_port->ops->finish_console_write(port, ctrl);
-	else
+	} else {
+		if (sci_port->type == PORT_SCI)
+			sci_port->ops->write_reg(port, regs->control, ctrl & ~SCSCR_TE);
+
 		sci_port->ops->write_reg(port, regs->control, ctrl);
+	}
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);

-- 
2.43.0

