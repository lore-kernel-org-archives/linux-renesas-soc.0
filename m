Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588399;
	b=uQjPiH/yUXSX0zu7NBfnSwOjxUgSDFoulUIyo0CF244tuErivmk1EcLW1zn2QT5fr4d1
	 nG4k7M0HvA6RFCHgR7vkgTnsbdOpBM331Vk6A0itxNm/1YD2NsBqLutf9HkjfpyBT5BCO
	 vNbyosEe7Xixoh1PuWdqRZVH/BkX32Sp06W7wpKBc5jgw71rXMh0ACByBoKcxx2UDnLSh
	 WuE4RoymZHLJiADkzXhpNee52uBoFaaN61HNNCaLnyyJY5z3cDxIDaHJky2KrJyG/28dM
	 EhwTc8e8HyazgGHZ29SrjuqDqR9vRjDtjCBBcgHcIX08kuTNd7x8Q7btHGiuVhzdtpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
	b=gyJIetWprRDB4UdgafMF0nE3G3hNGbyX8f8vx4vuoAPn3w5SiDkBxYEC7AvjLo8TClyU
	 6OTMZvJPT/sVflwv/mODlOq11IkHkLAdK3+tXTQqPB8IVyen3L8SbiFaRwrOdtlVo+ugQ
	 i8c0b7AFCl2RoQD6/UZWDRYAd12S+0yg4fxSVCPPqnRMGGu14SuBRKzEdcTeTzAj68Qi9
	 95KfRSDGEnjyNo9U1cF9PBC96/C1pjtaVBe7Rn6+ribLJszZKa7bcAVeHiG4MVTEAVLgf
	 jh/DcsvWczcykwQJOZwgnzdcUqW9ajksUDjYeSiAJlejuA8sP0osY40ZzKHzfrAnYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fyhfHnL2;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0F606A319
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 13:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B0F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fyhfHnL2
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso569029f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588397; x=1793193197; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
        b=fyhfHnL2vgB+Al2ATPFZaHH0oxN/5vfVtER8IQWKhOYBhNJT4FtRou7YxivrUyj3q/
         /nwzcxONL7tsdzu6Con8f7CAM2xMdFNlVyJAqfTIW8sh39WNInede+Y4Eg5Zh69OrGiJ
         IQM7UkpIOOctEq/2BwM7PDIPIPVVttoace+kvL4WGfc77/2A9+D6MtupCMTxRab/2Z8/
         Q2XNYMeslEdmJm0KY049Qy7mSASaa7hbwVcH5y0T1XQlCBZZ4M8Dd7wVCZBZmvJEzzf0
         fisK+iTfplb8kdiLOX/yhWZKbgqC3t4uWVJNU0xNe47VQ6+kMk8546NoIBfKmNiK2NI+
         XwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588397; x=1793193197;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o6p3pCo7kCCnsjGIBt4vEqtv3jWVT9ZqbdZWvk7buQ0=;
        b=GgqTLwG+poiR6kyzgZWZsTVrsJ4kBguOY3xzdn0a6N9XjTR/clX41/vhOkUb3Je/4B
         B9aApMO3qjD+6uOPnosyODIBOyseWyR/+xmGu/GfkUFaXhgNetx+Kmo1RjfSrvSMH/9H
         NJWIsCkZu4J8Q8uBRE0Ze1Qbph0YJV8HEGFDVo3evlCrxsFd0HnVJ2YvVG2X8p6V3hcS
         gPwKDcpjKIpAaz5piEy3/S2gGjBLL9ct1QW1mxdMUUidTixzcCjlSYHAcXhQrLUnoY4z
         pOl2BVe7wyEgXD1QLTAsuqQXM/PrQs8eZhMPZCcThh5+R/7xrUXnQiEMCQ7EvS4rmd8Y
         zGpA==
X-Forwarded-Encrypted: i=1; AKwUvBxGmM1ZyqywsFmuxOocosgYpV8UQWt92ZOu/auuQeG9BoqaRJsYQ2EVxuw9lWSQQtxth3OCVsQuSsmXSXuPvZZYrQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnDknuAjH6VAMi3aC6BQ/Tyrl0cLVGd8ggaux5nt0+Oo6UnxH1
	f1GzmWYO2z9snHSSERusPV2Vj3e52AAG30AKq3lYPgBchdVRizT3Ff3a
X-Gm-Gg: AYBFou1yJVm9as11bGDp75QW3BiZYmrYIEiBiY6kZnW75dU6pe3LxF0oI1uMg4w8X+V
	Gv1lFc1N7KZl8h5PRDc9PTNxs5x2/qBSY7Q5dMWsGhkSNEiZnXiGMvj6O16YgtKjxsrzi+ZHm9v
	Yr6R5TxV70pAZDo2HSMOixMgUvE16nfyxjN9qU+gLiXa606i7KM3O3pgJ3p/r2Uv/7/TiuzwMNu
	Pz2V+J4df+7BsYFsCZ9fpi316im304tnYE3rDrAAQXv+WwAgVU+J1Op6SaCoEk7efjFoYdeeQQl
	Fm0pNyQhrVDcELcXsv43tJE7a5u6mCjfqVW4QEU1Oug5YglMqX2Zgn5oi6JJeWtMh+//DPJYrxy
	ihZcKGgDl7l7py6x3gqWyoidvcgO7Ri85gsScMQB9ge0/zXAN4U/CPPOfueGAvNXF2+wwvlF2A8
	GKzRfOeU8AO4a2JJgOQZa9qF8j+Et5rgb2JrIBXBoZJgI12Gzv7Qqj3xOWva2vg/fR1kRX0gsSJ
	2S7JiRVop8iLRpyV5TqAWs0eRTPY+PxWB5vQ5+cDQZ175C6udofmG8EXRpR80Rwrx3I+lYaJmzk
	JUx9Tb67yggOz194
X-Received: by 2002:a5d:584d:0:b0:48e:28bd:e010 with SMTP id ffacd0b85a97d-48e28bde4b0mr2656500f8f.7.1792588396895;
        Wed, 21 Oct 2026 06:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm5655560f8f.43.2026.10.21.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:13:16 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Fix transmit handling on SCI/RSCI ports
Date: Wed, 21 Oct 2026 14:13:12 +0100
Message-Id: <20261021-g2ul_sci-v2-0-b4e038220018@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAGm62GoC/y3Myw6CMBCF4Vchs7ZNW+TmyvcwxNAywhAF0hGik
 r67lbj8Tk7+DRg9IcMp2cDjSkzTGGEOCbi+GTsU1EaDUSbXyijRmeV+ZUfCRucqxyazGcT77PF
 Grz11qaN74ufk33t51b/1H9GVLpROK3ks0lKVQgtLwyLbhuXwOdtZehyRo9z0gDqE8AUHqvtvp
 QAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, x86@kernel.org, 
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Au Dang <au.dang.jx@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792588395; l=2681;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=UKJg4b3SfR4kpP4oWIhEOgnGd98EBh9C3fKOCKd2yt0=;
 b=1NJHANvhrv+QQW8+t8rXZ8HELSt/2/6SELbVExz3/VnizRqtcgP50eKAy6UNf7GUmJoRz4YZ+
 q/+dgXcBcwsClSnKfz2cjoBWXVbYCRRGKs/PsjrY89rZYZBKgXjI3nE
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi All,

This series fixes several transmit problems on the SCI (PORT_SCI) and
RSCI ports of the sh-sci driver, seen on Renesas RZ SoCs:

 - Patch 1 removes the code that disables TE at the end of a
   transmission on SCI, which the hardware manual does not describe.
 - Patch 2 stops the TEI handler from turning the transmitter off
   while the xmit kfifo still holds data, which could stall or lose
   output. It also covers the TE handling that patch 1 no longer does
   in sci_transmit_chars().
 - Patch 3 skips the software clear of the TDxE flag on SCI, since
   hardware clears it on a TDR write and the extra clear caused a
   spurious TXI and a duplicated last character.
 - Patch 4 forces a TE toggle when restoring SCSCR in the console
   write path on SCI, so the TXI that restarts an interrupted drain is
   generated. Without it the RZ/G2UL console can hang during boot.

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-coco@lists.linux.dev
Cc: kvm@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Changes in v2:
 * Updated commit header and description for patch#2 and #3.
 * Take the port lock before reading the control register, so the
   read-modify-write in sci_tx_end_interrupt() is protected.
 * Extended the pending-data check in sci_tx_end_interrupt() to cover
   x_char and a stopped port, not only a non-empty xmit kfifo.
 * Replaced the PORT_SCI check with a has_tdxe_auto_clear flag in
   struct sci_port, set from the new tdxe_auto_clear field in
   struct sci_of_data.
- Link to v1: https://lore.kernel.org/r/20261019170139.473808-1-biju.das.jz@bp.renesas.com

---
Au Dang (2):
      serial: sh-sci: Skip TDxE clear when hardware clears it automatically
      serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI

Biju Das (2):
      serial: sh-sci: Drop TE disable at end of transmission on SCI
      serial: sh-sci: Keep TX enabled on TEI while data is pending

 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  4 ++++
 drivers/tty/serial/sh-sci.c        | 45 +++++++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 15 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261020-g2ul_sci-b610606ea5b5

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

