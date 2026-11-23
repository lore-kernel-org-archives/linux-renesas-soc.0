Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478114;
	b=gG4cl9fdoGSD2W8X8Oe+f9WpyZcoe6a/jnMU6KzkbLT7YpVOp9ElfNgpocJAaDhAp7XH
	 R/VZ9PrinZDDwvJlzgocgU+ROFLTOkS4sV2W8sQTmO9oXHli+UC82/XgkblC3eek3rKgN
	 4aUoxQdDtl29wxlMIikRk/XIigk5junY7D9gqITyh6ftcVJn7Jhp5AVyCtAU31uPX1VWa
	 vj0F2M4OCW1hNwgP02RmroldiSBhgdJHHevoICYtt84ngeYCaHGULWV4Z8JliUSfoP8F8
	 csAxua1fh5n256dvYKv0Y6Awa5UD1fYzzt3dAl8zxPFKxGsfOnn71KkYNg4M5rhFYpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=qHMYy/oSMlkongpCToMb8VA6CvYEq6WBh/L4ubY/+kU=;
	b=VR5Xy4gINR1SAntT3kTP7sBV99x+Yez+S+Vq4ND5uNfB+pLTDzx6YvqCaBsjbDPGeg3z
	 knGZ4Idy+yPaLpj3+UopE4eHAzVAU7/MQsTIDiiI14rG5X91tp9adBvrPwepxmuLD6q7b
	 RKkyS50shM+9e0OuW/HeW0gMhj+CYfhYTe11yuijkK////vexjp5GTSict9MNeIg+gX9r
	 tyQKwm5B0eQx9IiFAPuR4VBmywsVegMv4M+8dLEGPbBOhDxoCzegycayEtjU6cfP6OG8v
	 GFtqEuiHBBLzfAnmrrXnlJQIf7N4zdx0gzfv41bca3E7L5d7Id95iwqsXmZfAe/kolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aur9tjvm;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AF606A326
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 23:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aur9tjvm
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869f03af6aso3050757eec.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795478113; x=1796082913; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHMYy/oSMlkongpCToMb8VA6CvYEq6WBh/L4ubY/+kU=;
        b=aur9tjvmrmBWdMGBaCXGgk6MJeEt5iNGa2qSXqZLmaZBc2Kv8JbEJJBt3VS1koB28I
         wPtCKsMymrS7bcRsinSR6Pps6kUG8TlhWYhgGqFtf++305HmkHiwfHMIJuHdF5Ap6cip
         Rljt5/NlIZ9U9mhtnAmYzUhjNT3aCSRb42YABt/qwncHwyKfNii5c0Tmyed+CL6BD4c4
         SNrJeBXEoWkhMvBsdtQrDHPSWrJVVbf385hkj7Mgqs3sqWHZW4zrQQdrvg6+xWHKhuJz
         hAqpP6+B3jdDREVa4WW3LeGkAnl/k+FgkY0rMRFgWfYPg4TMz1LjwlQP9TfhRpV0t22K
         dgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478113; x=1796082913;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHMYy/oSMlkongpCToMb8VA6CvYEq6WBh/L4ubY/+kU=;
        b=sFVso6xt9tok1xNGi3StVF2P6TPMEWufPJJYbsvGqKxDlBK7nRJ9U9Uqp4tQfsOmFZ
         iKLAJgQ3u2BqFgXG6k9616XsiTvefqVGHtl/ai9/SPzE8EF6eYsiSki2LuBVXWgrHhw4
         S/VkI0vYihntXkb+c30s8xKkW5Zs1QBF5fokFNiIqFJR5Xx2DpErkzEGYOaTAPj9B+GN
         4OJ/00WSQVmnObGFjjMp/GqWWBO7EaUsQPHsvEIb/l4etssmu+WmFXcnDNu6Ze/MGO99
         mwDXF0N77hjFtQrXXYw1HDeoYnMaJrY9SadLFVPBe0WQxxliQOBs4pNEcgHhuTmM6cfr
         m6UA==
X-Forwarded-Encrypted: i=1; AL+hErEsDU0LQSukTC+kJDq7m6XPpbMeMm/HKgfiBnbGYzoj4545FCWAAQvs5sePs1U2h//ORIL70UJI4IRrUvCWWsP5wA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cTQe6vzk2Vc1oU/jC+F2wU1t8+CbF73/2LtqWoPV3FJzQ3LOW
	LpWWrC9Ro7qfZKX39swuIotAgmMJZuDpmpBUw475xEPEg2Ld2QENBnfe
X-Gm-Gg: AZFdTZf4oZjCtTwDx/2vQ0Vs1furj1vIcGXXtYX4uKEaENWmCRBCDhnHZ2pP42JfQwF
	Hltyr2Cwi2r9j1VIm8fRncKahOCthgW4JAVUphbhq/bZ13hSJBr2SJzHXFeZNbdtu+XmZMtKQY1
	jqdFORaCf+tetOdfHxEBtbroQFdvF7ay1NYWtBSyev7Zu7c0xGjuP9XorrJbB1E2On/OXXF+x/1
	lCILXWy03S6RYaXT40ZPyLN/ABVjuU/ho0xhNMKf4RryZbtYKrnyBd7MQUgNYUmC2ymUI7ClJhm
	oHw1XmL1GnBlCOSXPx4UtDN9jejJhp+bKGpAwu+1Sb4Q4HZ6I/3XXEBD9aoiVdHKJ7sGM+gsUBU
	jkH4VWb9NPpUKVq4uG0+mB8DcTtBzXbhQo7u0U+qLWxePVZaLaCkEwSmSINxTPqabUKHA9PkTsu
	eurpROWzy6QiNzBXK7ygGUYuCjHF5s9XHkdwphYZntbvIJrtwx7gjNHas8afx46d7UqAMlq1iQl
	XW/cbkxm34gJ8lwXAB1t0Ygc1ur9laaSAjOBRNA3BDrLgCByiQYe6NawJ8cllAdtiOYip2t1vNf
	nBgTNuu8cCggb6KXiX1qvrGjsCilT5M5c6jsmYOvNGduEpI1T7tZuWmCF8wzoiJQ6U0vyV3Okf0
	/ScTY/os9vw7ggSQ=
X-Received: by 2002:a05:7301:6a05:b0:386:a0dc:2e2d with SMTP id 5a478bee46e88-386a0dc3082mr11090356eec.16.1795478112647;
        Mon, 23 Nov 2026 15:55:12 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm68245062eec.3.2026.11.23.15.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:55:10 -0800 (PST)
Date: Mon, 23 Nov 2026 15:55:09 -0800
Message-ID: <2e4f0d32c05d841feb367741bf8802fc@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Rich Felker <dalias@libc.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] sh: mach-rsk: rsk7203: switch to using static device property, drop legacy gpio API
In-Reply-To: <ce838102be497ee6eab490b4454095b96e16d015.camel@physik.fu-berlin.de>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <3a51385d-9649-4bd7-87b3-0caf9e462b2e@app.fastmail.com> <arzKNhmoL6yiGrzH@ashevche-desk.local> <dea00f90c205f8359baca729d8b0f31a@gmail.com> <ce838102be497ee6eab490b4454095b96e16d015.camel@physik.fu-berlin.de>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Adrian,

On Mon, Nov 23, 2026 at 09:12:37AM +0100, John Paul Adrian Glaubitz wrote:
> I have been super-busy with CVE fixes but I will try to get into kernel
> stuff back again later this week. As I mentioned before, kernel maintenance
> is not my primary job, so I cannot act as quickly as people who are getting
> paid for it.

I completely understand; upstream kernel work is not my main focus
either, and I appreciate you keeping sh maintained in your spare time.
I did not mean to rush you; I mostly wanted to check how you would like
to proceed before the next merge window.

FWIW, I took a closer look at the current state of rsk7203 on mainline
prior to this series, and quite a bit of it is already broken:

- Ethernet (smsc911x) has been silently ignoring its platform_data since
  v4.13 (commit 3708184afc77) because device_property_read_u32() returns
  -EINVAL instead of -ENXIO when there is no fwnode. That drops
  SMSC911X_SWAP_FIFO, corrupting TX/RX packet byte order on this
  big-endian board.
- The RTC (sh-rtc) fails probe unconditionally since commit 689602e0609e
  because sh7203 only defines one IRQ resource while sh_rtc_probe() now
  requests IRQ index 2.
- sh-cpufreq fails init because sh_cpufreq_cpu_init() never populates
  the per-CPU clock.
- Enabling gpio-keys-polled (disabled in rsk7203_defconfig) clobbers
  LAN9118's IRQ0 on PB0.
- As Arnd noted, the rsk7203_defconfig kernel no longer fits in the
  4 MiB flash, and USB was never wired up for this board.

Given how long some of these regressions have gone unnoticed, it seems
extremely unlikely that anyone is actually using mainline kernels on
rsk7203.

Rather than worrying about hardware testing here, I think the simplest
way forward is to just apply these patches (with Arnd's Kconfig tweak
folded in, or I can send a v4 if you prefer) to unblock the legacy GPIO
API removal, and we can resolve any bug reports if they ever arise
later.

Thanks.

-- 
Dmitry
