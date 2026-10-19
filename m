Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429306;
	b=rM8LC5BJB8mFa23ZYxIVgyzQsUzXXYmCpkZ1ZbVC5DrQ/FDbQ1qhCJBqvtZOYznAlwAW
	 +RBd1/pjFnPYWrH31SZBVq3luf6KlQJSZmDGAjo2JgSgTS7ctlWoLvEYH8jrql9qW0rth
	 KH0j9C6BTetbb5qCWanizOfC/NIpB52TJn3qebrXYeMbDEIaKA1dnWc1SyC6bYsH2uzt9
	 MDVHhUlUO6+EyxhaExLlqtCUTgWQeZJwb5TUF2l7wiUJCtctWp3KloVjjabYRt81X7ov6
	 N7lDUR/MVE38xu/t+rCtTAy5O1FkjY6bqv45i4EeQjoAkNeyslLO0LpbVGYWzHpvZuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Chq+IJGSLoPBEVZuBAEdkqWQtRzkgjBsF6DmeMNI9hs=;
	b=w/2v2iEL/WoWXkPAh92AQB89JMBcMbdgHFWSbdBZOffrPBvl7kSbfbemneQKNVamA6IP
	 +JjtjhedT444TLUxGpPDVRkq0gttP0P9lrGkSxiFOjzaY5a8LZgIYaJGPlylSeFJaJmHE
	 XBr5N38Ucq3Nl1P/CDSVri4PhxsoVzZlg7GEWx9rKg8aec8TAXPflUQLoanbbzxixhx7G
	 5Ii18m3301+jdgigzazK7wPxR22UDHYXxvuBKkE47p7Muk3CEfVp4IIjPUY5mnaT+tHXX
	 ALLahuf/qt423cDwJaXR0YgnKYeQsksiw7ywUp6Z4n8S3I6H/pJeqPpfu3hs7sSmyjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nD3D/Rt/";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE0606A31D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 17:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nD3D/Rt/
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1287765f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 10:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429303; x=1793034103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Chq+IJGSLoPBEVZuBAEdkqWQtRzkgjBsF6DmeMNI9hs=;
        b=nD3D/Rt/3v+UqLLyXS9zHDk88H0JNoDmJA/arQlN7rTSRQxnPOKtmfOuYwguJUWkg7
         V0IObNusxnDICmfrMBo8PSYE9lNwFDPjkGX+ZjbYU54RHl426EWA5C1xt+UONWXZKrAm
         kGlfNYnyB3vM4wAA9Ji1DFNRu0bGOJBVm96xPnp3RggmTQrDszu1u+viCedkUPQwYswX
         XJMp7OVqKKZuRTTJHh2uFcAEWQx1UzGtGU+aAIi2HbTGg9nnBgPp8yA5asj0bp+5KcHE
         DB29c9EMBSmNfhxl8L8Sg9YVdSlUHne+fhbyteFgeeFpoSMVQIjzq6QZMTqvAZ/xjGa3
         RPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429303; x=1793034103;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Chq+IJGSLoPBEVZuBAEdkqWQtRzkgjBsF6DmeMNI9hs=;
        b=iAbMYRG40TtR6fzkDh0bBnzGMVR05i0nPkXprFu6qyLr9JJXKjctd52+6nqx7nVwx9
         IddokZppdZS0v+Okzj+6YzM5ZJ+Z0i8jvoU4cbOqsZ0N6R0n8OVIbz+0M3j5YLh4JlGl
         HTrwJT1HMSBF00WYyM1b48WCfCLgOfl3N62FkP3oWm2WPgp0C15jL05S4EHqnowRLgMM
         nf45FxNvyn2RQIj2xpyiupFqR5/V3pPrsHHoB4ilXIDpFdM6UOcIlFsSpq7eLQqZuH/J
         4DDPsl5/dgTEy3C37cDv9ep/ypyaMW+GAvsIYemBZ1Y3/ag+jldyIks0eurdcUyiJ4FI
         BB9g==
X-Forwarded-Encrypted: i=1; AKwUvBxJTVFT7d0QVKM3XQbhEyyP75r4EakWf6TPClfoznJVGioLg2efEpKU5ltZ63NjTfHUXPG5XLYXyKjtpl/vSZPp+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZYxhWQXHqCAg7UtvxQLe8agRNOpGZeACRCvZHdo1w34KQVDLn
	/kWk0upMI7QhGp16i8Yj+gGym99TM5bY+B0K1mc1Mk6HQQvsSoBh4qEF
X-Gm-Gg: AYBFou1nO4/3E9il3s3MVzFh1HLWx+IlmLLWe1mUp5pIj138CzP6mynrx84ab4MXd83
	89+Gmg3C92ZW9ptqgkodyXPZa1NcURAHN1NST1K+Ts2/NNvcCqiF7cczDbsKonfbTegkjiZ/CLV
	COBFwwUQRYXfIJSEgEnZ4jmZQpgj3tp6nGKhl8GXuKP993gtxzqUP28D+gBGl8rnitQvAYsy6Xm
	1YiA9vpHec2/4EtgRb9/iEobKhYAk92xaluu+jx8DeZoD9NVjS0x4cUY4n6Eqjn5N7ZPb70RRuQ
	lbiAvPSM0o2bkUU2rz2JumSDPuk5NVvLqCK+74WaJG79KgSw4L2JCToL/xcEWIzc30frwgvPwiY
	JRfwyGDzDwIR0ZOqjH6zJFA70rtmPSDv+m4HOpSMN8FMe2Npf13eV2nzvt6R+MQFmBtee9nKwk8
	Kqqaw9hYJA+P+K8qyNXkBK6Fi25xJFu0qGiSTlpbiDo27cY4+6hpxbKl44EHWIyFdh6ydCc5He/
	eGCN10Kms5oAX1Y0GUaMdf85KuadCMrieOSJKnyPbyKZrOAC+PuzN07
X-Received: by 2002:a05:6000:22c9:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e07fe3d59mr19938200f8f.51.1792429303334;
        Mon, 19 Oct 2026 10:01:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm101784f8f.40.2026.10.19.10.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:01:42 -0700 (PDT)
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
Subject: [PATCH 0/4] Fix transmit handling on SCI/RSCI ports
Date: Mon, 19 Oct 2026 18:01:08 +0100
Message-ID: <20261019170139.473808-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

Au Dang (2):
  serial: sh-sci: Skip TDxE status clear for PORT_SCI
  serial: sh-sci: Toggle TE when restoring SCSCR in console write on SCI

Biju Das (2):
  serial: sh-sci: Drop TE disable at end of transmission on SCI
  serial: sh-sci: Don’t disable TX on TEI while the xmit kfifo still
    holds data

 drivers/tty/serial/rsci.c          |  2 ++
 drivers/tty/serial/sh-sci-common.h |  2 ++
 drivers/tty/serial/sh-sci.c        | 43 +++++++++++++++++++-----------
 3 files changed, 32 insertions(+), 15 deletions(-)

-- 
2.43.0

