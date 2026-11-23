Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400519;
	b=fAuOtIhdU+y7t9qnyk/K2ZTcfVwCI4X57isi/1RX5Ecmwr9v0AXVICpD0UUhSfZNjjMS
	 Kh4EdA+ZQtybwbh/zdfdwlbin1oEOMIKn6nUMwBv+FoKas2MIe184yR4S0zbSFRi6w3c+
	 QysmKR+LGzl8v75vpBKcolD7Yh9lkv2vlGnsqK5IzQI6yrzfN8fDarJV3zeIdC3dU0sAz
	 YD1ubUrw/shPNNlVSFuTVUp6kz333BzTIwYmkcBljNTgfC4G4Y0evsMEuxcWPWOEeK+Os
	 htNZe7Iwdlx/hHM77BFFC1VdRXZV+Bb2WdkCQcfiub7pl/NTDRITeAnI38gq3NmooUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7z1Gv8DZqTonL8NQOcCQ3nD5cE9KuQPz8cFsKhy1wzY=;
	b=C+lZKHQRmWLS5C4aAUF/uxO9BCM2j/ErYSJRAS3TR1hwj1e1BHhnXAdQM0kQ2052vr6u
	 QootBcw7kgX+4hfmndnojB0rurLsVX3o8wfRUwvTDILQm3euYWhCdBjysq7jXRDyes9Zv
	 2PbmGOdYZZdm9Y9zfzMWMsmDlIFyMVz5IEMk6YGKcW4vZgZuiVBAqxWfi+UMb39pT/tG3
	 29/e3xqwTMYlUHST8XkB1wUdqh0PH57HuO1p4YZRDo6sPcjGXIQkKawQGn3SzfeV8US5/
	 FCW6dh874grK9gAHS6gfsZNXabB346qaWr/DZBYrtJ4f6RdnKb60Vwy5oRr3JAtAbrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHv0Omhg;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E2A606A320
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 02:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHv0Omhg
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1460753b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Nov 2026 18:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400518; x=1796005318; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7z1Gv8DZqTonL8NQOcCQ3nD5cE9KuQPz8cFsKhy1wzY=;
        b=yHv0Omhgz8uWepm7J/4YrQA4APhnXKUUJY3fhjf/LbZ7SaKNPdEn02Ym0b1q/apoOb
         5QEKjfqIsh51rEvbhE+jjyG0Pzh8VjLVan9Hw4hGqe+dDfXUa/IdiyH2aJBqG+NNvr2l
         pyfmQ9KLTN9a1FC+qb4ReEcRVd24C4M2pIPVtMykiIHxAy6QtUhgS/SvC0A6zqH4bYNq
         aV1TaPFrPt2Pior/nRtKwtleJbpebDgws3U1xAvGXLoUFdQEhqYiAkHcnFUmPjOg8uAL
         PUkDeVcUjp2eny49h0Exi16QWNKMwijdZqDMQJ282tBKZaZJFgT4tw476FBNhlHJT6DG
         xa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400518; x=1796005318;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7z1Gv8DZqTonL8NQOcCQ3nD5cE9KuQPz8cFsKhy1wzY=;
        b=IyKhNXDwS85r70hiJ7fV4EWO9mieQqoEee4fjUU2E0cY1clwRycRU2PhH5Wg+ouYBu
         6w4vCbm7L+6nL1vQUoreF5xUdLtpZNTIVv5hiqN7SvexE1RfObutzDZOyJabvmbJ+A3Q
         JLVyYSsb4Vzp0OrJrHpswx1OGTvxcYwM5rZvbdy2wY2GycgQzfa286prf0zep3G36Gf2
         M6T5dpTzh8fXKUrdVscorYGQZz6Ta/lCcU6BJITgfLlNLa2cGvT9cSWs1YNy56otrafF
         L20MKl37POHgvWYV8Hb43R4RmA5wi5nZz2Bh8z3krV0GGypRMjaDLoSKTlThWC+W8khV
         Q1iQ==
X-Forwarded-Encrypted: i=1; AL+hErEHANfaitVRZdlvXV6L6kfGUF3r4NvZOcymbPUDcOc/HiZYkXuXDUH8OgyUD4yBq0s3se1GiCKZAJnwmDKumf5M0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ThnahWE+8Q+LoO/KizmqGK0PTMzqdqJerrraJpIGOuSkS6QpJ
	ksDjU4rJOs1PwsXoPsw/DFU0AlmYoylBvjQTmL+8qrPi/kx4tdd7MtpR
X-Gm-Gg: AZFdTZeTVetEVM0yBIzzL36qT6rmY34HAWKqlyWmcV+d1qrm8sFTVhesdDucmIloFKA
	LaeGTDAatKuWbvCe2E3VPS8r4DH7dAcsz+xSy+UrYDqFvnPQBngmBT9sxw0jxTumVnI214C4+wX
	dmUNYR4OkPymcK3J3DPirdBWtTKesVJxASfkGHGeeoZTjZpGlx/ka/8EtTJmjdCGf2vNZrGB5Pb
	+WqSD4rTLDsZcVeC4b1wcGGbKuFQZESEU7FNEMmQGo2tI9elrk2VFCxLaBkfiHRHheAiFN1cc+c
	eyRY54476zL8JCDZdXaP9MyPXE1y7CIBgs76yYm8YjnHZwvCyS0S/Empqx+tAqc9gG8COnvvf0J
	+eNHHLQ9sp/n/OrMnuZ6bPDIvyB1qqUk8+hD9Yl+e5vVkAfxIEwm73gOxr2XO03NIUN44gzg4CJ
	CAZeXS1Eegktzq511dbQDSdMpVwdACbhWt/sMAGlqAwmnTYHLOO1bdsDhUeoYD17cdGuTyBoZu1
	j9WZdMIx967BBAn3sSZ3O3wyimT6tkykEBBPKJdr/a8bKJFfjIJpAwXmKTPA5sOmlaSywhBikiN
	dr1SrT5TKTEqJvQS79Zq9dnxxt/wYPLcQjyxrZA9O64NaIJk6L+k/heGxY5EbBvDD3Qb3pVBiwA
	W4ZNy1I4mwXrb5Lr1JdoDFgeK
X-Received: by 2002:a05:6a00:181c:b0:8a0:7024:6360 with SMTP id d2e1a72fcca58-8c87b8da4ffmr8880080b3a.19.1795400518398;
        Sun, 22 Nov 2026 18:21:58 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm4674426b3a.31.2026.11.22.18.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:21:57 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Mon, 23 Nov 2026 10:21:46 +0800
Message-ID: <179540050658.417371.12537370024433882605@gmail.com>
In-Reply-To: <20261122140906.GA3898744@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261119062203.GC2300348@ragnatech.se>
 <179508711555.3615492.10674834361832600268@gmail.com>
 <20261119162517.GD2300348@ragnatech.se>
 <179516779969.759914.14349189301325900521@gmail.com>
 <20261122140906.GA3898744@ragnatech.se>
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

You are right. I do not have a ready-made reproducer that exercises
rcar_thermal_remove() on the actual driver. The 17-check test exercises
workqueue and shared-IRQ primitives; it does not show the original driver
failing or the patch fixing the race.

I should have made that distinction clearer, rather than suggesting more
thermal-load experiments. I will keep v3 on hold. If I can put together a
test-only instrumentation patch that forces the relevant interleaving in the
driver's removal path, I will share that for review before asking you to run
anything on your board.

Thanks again for offering to help test it.

Yaohan
