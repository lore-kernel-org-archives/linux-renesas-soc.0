Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167807;
	b=0vOdsGGpY3TW55wOisvBOaqITLJ9t3xdnKtsTaLZybCpcgWrySvMys1jMOmqs2vhlbkB
	 rk8bIHHNTs99uzcMYnaduelRO8ycVVGWli0XT3lUZbbCka8QSGJUb9jRH3RF+oZT2yuGR
	 7jjxgq0finzQgeegnCeyZTdmCMutb6w9RIuprba8xtoLxVNh79B5tQs/IQObo7IESMBSO
	 0dvNH/09pZHs5eojONj5lAs36w1+CdAad225K67UfPUQsgdxPUyt7PRH+Sg9LAghGU5da
	 WxcUwn+ar1TIXdzg37RQUtXeIkMKQ2gXGBZKoq+UaUoeS+Om9Y49pdiVBPItSsa9bHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=EX+PW/7sbKTj4iiMEBEnlFbpgWQFljqyfDjuaTarVMg=;
	b=ytlXdpyKiDs0w7mdrRetE3Dd2r3vXr3TENAOaK6RBONqnTV8d43Tg8bvssWU37qs83W9
	 1MdoKDfNGf+hxfDB3OYqLzky/I7wVi8EkshcwgQ5FzON+KNS1DH1KDp0QZIHDU19PAi1d
	 870FBCbbFhk+hVuv/Z/RXDPJ/D97QVZzMDAgZm5Q+Ap85bmgnlzI/paZkYMvdVcSFS1KY
	 lPrNSpa8ZHu/6D3flgvNgZ8H0ATci89D3xeFlLNgqXE1+rOBV6DEo1JIjZzoFJkv7IxWG
	 t5EJAD7POg6uoiciFyZqhpuxQEtyqmGfkvA2wJK7f3uKkSaHGwp5Aol7rkmXTEk/E/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfutiSpq;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id AAFD5606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 09:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFD5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfutiSpq
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso402348a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 01:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167806; x=1795772606; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EX+PW/7sbKTj4iiMEBEnlFbpgWQFljqyfDjuaTarVMg=;
        b=tfutiSpqfKENDIZRqrdOIiAMOgjM/ngUeVxfahA5i27iAD5NHIIUU9l8FvZ1KjteDf
         eawKKtN76lqgLIKpwgOrGAbx0ZMRC95RDahIqYbq9yj46EPs9p9Eduh/qmY++CYme+Br
         pcXV2p7RNPDbRqFDZVocropyy5BCLbsy23cCPwJvycfD2BMEjXw0qbmfzlwQAWkHSAOT
         LGA5ZBe4naUUXb51n02W8xl5J7m3CCzQZ3g8kCX2L5j8EGsxOXK4/qPiYWwJadEvpyrP
         aCDI9dglhsGUFpkuOT1oYNXLemOWBIKTk/bI2NUUMnEEtZv3JVaK7x970D9nw7eqUG9u
         oXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167806; x=1795772606;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EX+PW/7sbKTj4iiMEBEnlFbpgWQFljqyfDjuaTarVMg=;
        b=w5VbD7X/KzgIl/cnfcfu2OgvRlBZlsu9lJmtuLBmhxlU09OIlFgcR97y2EPa9kzEt/
         UJ5LNuYosC3JpSj+mto77xfYIN2aICJ8702Y7m/NIMyaFtd5teUPls6C3LimmMABCuGf
         XL79dN+vlT44aEwI9/r9r08X5xslpnNO92zzS41AaMGZFEPwoNaRDdnjCAftrqyrFPaQ
         4Y1jiX+wGSmLpVLlWNJtlnXVSrQMAuTjFMCFWhoqWV+5RXP6oWSd/E/dJwx152Bx/vXo
         33WNisrf+vJOvol67xv8L2g4LTtKUa2kPh/wrE6cHVJMwmVsl6b5wuQwk0/qoNjQZ6Pk
         flcw==
X-Forwarded-Encrypted: i=1; AL+hErH2/GleEiboNjk3M1T0bSd34jgLCRPlk94alR6zf6KM3PwVtIk0km3LucCvibOOWDriO80hRKNkIPSk1SlESYuFUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+biTgJql9JJh//+vI1ppqzSvujpWspOQwRt/MGLaWwUJXWBKKw
	Lud95B+Z1wTYhEujqCVatEf39Zbea8olzoD2Om7pKCZDKyndVpoMWojk
X-Gm-Gg: AYBFou2WYjt5zPMvod6WC0q+6QrVf+e2HTsQhRdp+MtGgkaAIn5xuQNZprk3QcPj50v
	Jp/tLHJzWEAMv2b4tZxyAGVA2i4HkcPh8wE0Gv8LYMnIR0Nq/yWwhYT4pGnJCJMLJMZndT1l43x
	l02nwYCPkuKa0dnIj4RnMcGnN14zwTNR1KGftDG+uC7yG4LNXvdkxn+RzKC+vHW2ECPVFz4Q/ka
	nLCfbgJZo8jjSWoeiKUmfnMJXUe2iKyez7EFrw7EawL+MDd65ElnLVQNe8hWSGsXWRPgYYMBg1v
	VSDldsm8eb9T32cifMFqS9BgVdz6yHBRqZqwWqJm6jIFugEpbs8Q6jSzsDGaRpF+Kaudmg0DAsg
	LoeA4BdTgLB10dSQp4DDBjeDjNIZuW4jKzxKnHrGhpW92J3KZXFVk0CzqKIaf2JDM787KkkXfLY
	DGOcOvlDhXavOQbvrkqGRNJJ3n79/voBd4eY7Kr/ncnys3o4i7+nsk0723e/ObEyW+J8suoL99U
	il07bLB5w8ulXGGhG0oyP+nYG4eFcW0KOv9jGvznZOXDqUV7Up5pOolMsOJ9HM6H+lEZJ0wemIn
	ATfJiq4NKwoVYJESkXsv9tTrCNwIHvk7L7cJodCJaTGtAHtLpBuDfLoLMiPK2iFAxVIfbSkDZRH
	KdDZVdxz+6WL1mHzUBALkc12q4A==
X-Received: by 2002:a05:6a21:8210:b0:3fa:5301:d6d with SMTP id adf61e73a8af0-400aec05810mr3382866637.44.1795167805658;
        Fri, 20 Nov 2026 01:43:25 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6d03adafsm1103571a12.23.2026.11.20.01.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:43:25 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Fri, 20 Nov 2026 17:43:19 +0800
Message-ID: <179516779969.759914.14349189301325900521@gmail.com>
In-Reply-To: <20261120073021.GA3126029@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261119062203.GC2300348@ragnatech.se>
 <179508711555.3615492.10674834361832600268@gmail.com>
 <20261119162517.GD2300348@ragnatech.se>
 <20261120073021.GA3126029@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

Thanks for offering to test this on Koelsch.

I went through the Gen2 thermal driver again.  One detail worth clarifying is
that rcar_thermal_update_temp() programs INTCTRL from the current ctemp and
ctemp - 1, not from the critical trip in the device tree.

Gen2 reports the temperature in 5 C code steps.  That does not mean the
physical temperature has to move a full 5 C to trigger an interrupt: it
depends on how close the sensor sits to a comparator boundary when the window
is programmed.

The handler masks the sensor source and schedules the work 300 ms later; the
work updates the comparator and re-enables the interrupt.  So this path
normally limits how often successive sensor events are handled.  Reading the
zone also goes through the same function and reprograms the comparator, so I
would avoid tight temperature polling while trying to observe interrupts.

For the first step I would check the e61f0000 entry in /proc/interrupts.  The
line is shared and the handler reports it as handled either way, so the
counter alone does not prove a thermal event.  The driver has a dev_dbg() in
rcar_thermal_had_changed() that prints rising/falling, so

    echo 'file rcar_thermal.c +p' > /proc/dynamic_debug/control

should show whether it really saw an unmasked status change.  That needs a
kernel with dynamic debug enabled; if the file is not there but debugfs is
mounted, the same control file is at
/sys/kernel/debug/dynamic_debug/control.

If real sensor interrupts show up during a controlled temperature change,
then a small number of bind/unbind cycles comparing the original and the
patched kernel would be the next step.  I would not keep a sustained CPU load
running while the driver is unbound: with it unbound there is no thermal
monitoring from this driver, and the trip is only a shutdown.

There is also a condition that may be easier to observe than the UAF: in the
original code a work that is already running re-enables the source after
->remove() has masked it, because cancel_delayed_work_sync() waits for it.
A test-only trace of the mask and enable in _rcar_thermal_irq_ctrl() would
show that ordering:

    original:  remove: mask / work: enable / remove: done
    patched:   work: done / remove: mask / remove: done

If the natural race turns out to be too rare, I can prepare a separate
debug-only instrumentation patch to make the interleaving easier to see.

Thanks again for offering the hardware,
Yaohan
