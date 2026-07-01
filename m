Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A134388C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916208; cv=none; b=KafWA9fziirMXo7a1PieCe7avGhLCa3zpE8PUh/pAogtpKtM8rS5ESHUYjwBGz3RikLQk6sYDOU58irEd9mUVKtHduxwWq/WrjeKobZwasVFxnFpmo5CPQqxZ9zt6Maap/9/W2a2zhNCjUheehDwbYrRUVE2bBU7FDO21Fbh8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916208; c=relaxed/simple;
	bh=8tMf9of1hA9B09zTsEqb9QfyRZFVq2ZhtoD+Z207EwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2uX2WiSBauAkBO4P3QkdPRG3pmK3RAQ9zmmqkLm+SMltCzsqG5eSrCVTBgroGfwVoafpbcBc1syOd1kZcBIqDhow0ob6+ihIO6yn0xlNljZxcZ4MfYwlaVHcCVogh2KNintLWi690QyQpOGh2iaNdv0GyciepcwQZ0AdOdYn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nikOKHcq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nikOKHcq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475417f010dso485389f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Jul 2026 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916205; x=1783521005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8MY1uOb0e6tl5YdQ6QswXclbgEru5/Lk+DRQtl6luA=;
        b=nikOKHcqFY9WpyU3/JhTBhw/63nMuThfAGlYGdfGakZR8c/hcaMZW0RYx/1q6w5Kth
         Fa8Pgb67y+MOc8f6H9dQP3Mf4J/foUjZks/pI+HUlbhQzB9Emt5TvnilDONNXndvKM1u
         1iPBVK8qDhp81esPQznNbIhN4dKYaSeKxJ+2ud7z0PjcGXjiUs6SZKYgrcaCf1+d3zfF
         UvnVW+7dLeFmTnFb+tRxJLRIU0uWi3MtIfnlrZ61mIiSL1BOwXfMUnRe8GVneCJuyott
         oldOg5M5VKLYbjIfYILK7amS7qJR46mFzWXJFUXOgnvu7UBh4Wyl1L/mm4tqW9IJXB6R
         x70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916205; x=1783521005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8MY1uOb0e6tl5YdQ6QswXclbgEru5/Lk+DRQtl6luA=;
        b=rnF/CMK+xAEhst1/dRjKxtWqg57sIja+A7bzlsMV/JANsP7UGtnwEHcOSXo64hoEli
         8NHcAhC5WTPhBrdafE5k30HBOV2TxguqR19KObEdAHXl3Qn8Tz3mpAY/TRVOmnl5QW/r
         GQgpty1JUdkKgmPUuiHJ6MUqodAMkt7x3EJ0ELkPF8UhDv1ADIpUDhvA/WVlx2+EVKUT
         7QlqnthdRO1ZmKAk76uLibaxUamn0X//hVVCPPYyylYMG80UCdQ2jUmUCPzho8LfLgDs
         UADoekKAE4YoOzke1hnpI/h1kQeu5BqPtrn6I6YgqKRyJFV8aLn6JrgwEqGesYh3UisO
         tlDg==
X-Forwarded-Encrypted: i=1; AHgh+RqDsS8mmK3HuOdCzIZBmH0zuNk/XIevb25aCayMopxInEzybSWJoj7u7UlVGRu9qmMIC7RGvueKSpa+nSqOSSUR2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIXJ8Mn+Fi9ygW3PpydCYm+fdldwoPFezPk7PiZDJqBVN2BMYp
	u9BUrPd8fCS/PcCErVbRhfcrRb7yGqEKWKZeTn3WjiILkhhk/QADo94f
X-Gm-Gg: AfdE7clymGySnhihtuJRSIZftcAKxCehOuoMPayTEqLAI076k/7+CQsQK+gQsSyeEnC
	CFUpnIByi1xbOv8CHRDp/36ujqS8uRkTjGtZSeqR/tT7OgKTmapzzJgTT4CEjCYYliFkWIsTj7y
	jijDVa6vksVNf24suV0iFJPdyrIbMp259QXSXMK7ZYDvqdNB/9JAIjGI4Bnn+aQtbTUwZ5DBmwP
	4b+JoezlPCj2KWArrWrtDvj9wPCedU4dGQnI63mpvfKHQABehgjIQvY8qHI40Sgm/oP4mVFV/PI
	ZbhI/CMTkEr3B4rloVmmsq8TgtaN8xD0gmp2y+l6ix3/QdtnszTQtU0vavdeel1fyEGz9g93STK
	NMvIASwWOGl3KAkwxF4RWRgorCbtCKk0eBdMRstw3ncj/WpByyDPEPgHwV3p/ZJ8w9CpZ+Ae3rR
	AcdFEVz/tAgBcbmV+1hjZFf3ys/3+JkHt7xJKTBdHpVZKnZp5FNfkvxAsgQk/wVyfaYmWWi7q0K
	dq1a9wxk8v9wXFi3JhwrI5URNdJiu7LkpC7Ww==
X-Received: by 2002:a05:6000:460d:b0:461:a161:8102 with SMTP id ffacd0b85a97d-47759098042mr2799561f8f.28.1782916204804;
        Wed, 01 Jul 2026 07:30:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/10] Add RTC support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed,  1 Jul 2026 15:29:43 +0100
Message-ID: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the RTC IP found on the Renesas RZ/T2H and
RZ/N2H SoCs.

The RTC block is closely related to the RZ/N1 implementation and can
reuse the existing driver infrastructure when operating in SCMP mode,
which is required on these SoCs due to their 195.3 kHz RTC input clock.

While the RZ/T2H and RZ/N2H variants do not implement the RTCA0SUBU
register present on RZ/N1, this register is not accessed by the driver
in SCMP mode, allowing support to be added with minimal changes.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Patches have been rebased on top of next-20260630.

Test Logs:
----------
#rtctest
root@rzn2h-evk:~# rtctest
TAP version 13
1..8
# Starting 8 tests from 1 test cases.
#  RUN           rtc.date_read ...
# rtctest.c:59:date_read:Current RTC date/time is 01/01/2000 00:03:09.
#            OK  rtc.date_read
ok 1 rtc.date_read
#  RUN           rtc.date_read_loop ...
# rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s (with 11ms
# rtctest.c:151:date_read_loop:Performed 2790 RTC time reads.
#            OK  rtc.date_read_loop
ok 2 rtc.date_read_loop
#  RUN           rtc.uie_read ...
#            OK  rtc.uie_read
ok 3 rtc.uie_read
#  RUN           rtc.uie_select ...
#            OK  rtc.uie_select
ok 4 rtc.uie_select
#  RUN           rtc.alarm_alm_set ...
# rtctest.c:262:alarm_alm_set:Alarm time now set to 00:03:49.
# rtctest.c:282:alarm_alm_set:data: 1a0
#            OK  rtc.alarm_alm_set
ok 5 rtc.alarm_alm_set
#  RUN           rtc.alarm_wkalm_set ...
# rtctest.c:334:alarm_wkalm_set:Alarm time now set to 01/01/2000 00:03:52.
#            OK  rtc.alarm_wkalm_set
ok 6 rtc.alarm_wkalm_set
#  RUN           rtc.alarm_alm_set_minute ...
# rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:04:00.
# rtctest.c:414:alarm_alm_set_minute:data: 1a0
#            OK  rtc.alarm_alm_set_minute
ok 7 rtc.alarm_alm_set_minute
#  RUN           rtc.alarm_wkalm_set_minute ...
# rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to 01/01/2000 00:05:00
#            OK  rtc.alarm_wkalm_set_minute
ok 8 rtc.alarm_wkalm_set_minute
# PASSED: 8 / 8 tests passed.
# Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
root@rzn2h-evk:~#
root@rzn2h-evk:~#

#Alarm for next day
root@rzn2h-evk:~# date -s "2026-07-01 12:45:00"; hwclock -w;
Wed Jul  1 12:45:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 86400;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Thu Jul  2 12:45:35 2026
rtc_time        : 12:45:34
rtc_date        : 2026-07-01
alrm_time       : 12:45:35
alrm_date       : 2026-07-02
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

#Alarm for next week
root@rzn2h-evk:~# rtcwake -m no -s 604799;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Wed Jul  8 12:47:38 2026
rtc_time        : 12:47:38
rtc_date        : 2026-07-01
alrm_time       : 12:47:38
alrm_date       : 2026-07-08
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

v1->v2:
- Dropped wakeup capability support patch.
- Dropped header sort patch as it was already fixed upstream.
- Updated commit message to drop reference about RTCA0TCR register.
- Added Acked-by and Reviewed-by tags.
- Updated Kconfig help text to keep it generic and not specific to
  RZ/N1 SoCs.
- Initialized rate variable to 32768 to avoid timeout_us of 0.
- Made use of RZN1_RTC_SUBU_RTCA0FX mask for SUBU register access
  instead of 0x3F.

v1: https://lore.kernel.org/all/20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (10):
  dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
  rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt
  rtc: rzn1: Fix malformed MODULE_AUTHOR string
  rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
  rtc: rzn1: Fix alarm range check truncation on 32-bit systems
  rtc: rzn1: Dynamically calculate synchronization delay based on clock
    rate
  rtc: rzn1: Use temporary variable for struct device
  rtc: rzn1: Consistently use dev_err_probe()
  rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
  rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  35 ++++--
 drivers/rtc/Kconfig                           |   5 +-
 drivers/rtc/rtc-rzn1.c                        | 104 +++++++++++-------
 3 files changed, 94 insertions(+), 50 deletions(-)

-- 
2.54.0

