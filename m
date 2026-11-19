Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087123;
	b=Mw9Q9oJBZRoPSiZEW7OxbJhmSXvvKQ+t8oMBWaBRIT7schGgt/RmpeN8mhKpuL5tNolL
	 1rxT2r7/UNFoKDMn00JRJseLBjUdyM2PXWno0muiMKfQPqw63AgBZ1FqJ743OuFtZnjMJ
	 Xzx2dPm/kg6QHNIODE71lEGdjiToMI6Q98OiKtH1GiOfowN9/XcYawtTjtga1ZQiFgp+C
	 VSw6PPVq4Lf/kHoPwrHXJGiNqubyfsnoGi983QUGHbb7oFG33UUqwLnosaH+ih68kE2h2
	 62nM096HyBZeT3ElxEg2wq1+/0VH2QcTtIJrTxS8FqI13lHRhnccTmhutTHEXz+RTAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VrCvkLrp/royT60LvX87nJ6hEmqSNe0EsAi3XYZ2mds=;
	b=qtN6oGZGUBo+hql5tMB4uepY1/pUHL+Cgn91g9XSmDrzBRdvQtxiEYwsKRy3Ul3tiw/e
	 vIaPmf3cMq2Ibzs07JVIbNUUhqO2urTfHWOOHWZBfO6bX9vPWmx8TQa26jZdRLZ9Kv3jQ
	 hyGqcigM57/mzQCw9nNm3cWi6/vAhmHT1Vz6OzFKGvtWDMgH+BOiMUcmoKhije1gRXV5K
	 qteFmNlWg7HlAblCjUxV4VyPTZk8v7E6ePwydPpBDroMoi6tSz2u43bnCIyxVNK9Xks/z
	 Q2edmIDRIIZDtAh1yPlUPW8Z/v1N1VTxDhGfvYB+pYGwC09DditCF7PT2H4eENTPUsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yw1+nWQX;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 50DBE606A325
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 11:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DBE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yw1+nWQX
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381f65e4e4bso3274798eec.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087122; x=1795691922; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrCvkLrp/royT60LvX87nJ6hEmqSNe0EsAi3XYZ2mds=;
        b=Yw1+nWQX/9MPwkAQh8pdVQIdLTe/NkpdOgbv+Hll9VJQoYPfSURkPu2iscTiJkjEct
         TpTa0Ptw3z8VupAMDUdwL6ygvS39Yn5ve7hKPF5Q+B6+04VKOjLIBq2KKBqXfwRYy3Iw
         +oLKJ9tvXlfNyk14X22x8S0UMhzanidJDLQ0Z6Ryh/Ui9a5UeTGY1JBG0OUmc5jU4f6G
         LTZyf0htrPp8Pm953jpotEQR13HKi5NqC3e5weOdI7242gW20nnr2gOVHO27wxi9SGrn
         3aOQs5KKbKsmT895tbtxnO8OJwW/pe7+sbIkHUKTC3BG1sfiQhXBSOqXfHJSWTizaMQG
         ZrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087122; x=1795691922;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrCvkLrp/royT60LvX87nJ6hEmqSNe0EsAi3XYZ2mds=;
        b=Ts8KER6uAIJQwZDp4/GOc7idI/NWOTqFns861MTDIMr6xaYjphVU9PTtmrpHlNA54v
         g4ZyvKW8PYNW3EumRriS2zL8bevffTTiMxlg800RIJB4hcnzOTd1KDDAGwMUQUsVo/2M
         RIqR85Wuox7ebZAweAigVXhAd/3lZ08awIgkN0b9HvcqLMek7w5AGJFXTeC72ZmZ3pQd
         5EGyqqqb1Zvf3lSfraLAad4BmyagvmlUG/OHezwt2RrjbBTOT8xORCPEcB7umBKf9mhX
         XHzIRx9VIDDMuc90nc3OQNtYKJeiP5u+QtBTWrpTK1zjIzSNOIUW7CmOrr27qFh5vYH0
         3Z7A==
X-Forwarded-Encrypted: i=1; AL+hErGji6bMVS01F6pTBUpr/5NpZdQ9ck8/Wa93WC93ODwnZh1KJszyvJoeeigDCNlNKddt4Pb6ypWhou+NQ0muZusRMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cc1bQErHxRfF5o/FAwKIii7qotg9wojB7HVkoux15nPSOxx2v
	CT8d4/zdzpv+KC7WD6omGmMxQSd0jXSZUu8SY8neBa4k/Wq7rF57+m8R
X-Gm-Gg: AZFdTZeIQgpUIBIiBvA8TdxkvxtkbZEsCnqbrxr+m+/ENP2IUdhfSjo8ENwom+nudW2
	yFmK5ctNaPGdRwAKArEz/LR3sC7dzFzzNtCQzQ9Oj0jNEg9c/gYQ4Io6cJ8m4g5ybQ2VcimjEFE
	Em802EwB1KgXx1mrlwPeOtt8iJUUKeS5Rr3hWCWNoXHjntejWRpnAcCD5pl9mCLlywH2UyFg2AH
	RTsOnvTnAvxy8UtG9f/0hvs4XCG2VnpZasS+n+8XtD/Pit47sEn6hkprTsmHw4/VMWAt/AFvHTf
	vpXtz/tczai3JkxvhMjkdOTnr1RPsTwVTutTYqEKkQ8sTp+5a0qyZE+GaPT7DmJH/m2PA0KYDdz
	tZdkNFFxcoPMGTMhCE5iZp9qCr/abE2bWZ5a+z7W3mTGkt1tfhY0MxQkObWmuFrC7VUwnwI8Cn7
	fuHLqwgWj/Pql+TOdtawEJTpWPRp1lwmuyg34D/9Jud9RXDzN6Kv7xknjw1YOGBQVkKJcrdJEJp
	hJL+NyTdzd2y8y/ODsKpW8hP4QLxN+7TE6hFqqV6HRRwpc5iGVTvHbH7MpGQqKzBQ+J9STZyI7f
	d4rRNVyFI3sDRdJRbr1zTgHKg5UFsc+SGN9dvIMQHjlCQFgruFZ0WI4v97UsqK+22h98yupiq02
	HD1nO5dJ9vOXLVheJJFHbgRIK
X-Received: by 2002:a05:7300:b2a8:b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3828171b0afmr5821926eec.31.1795087122102;
        Thu, 19 Nov 2026 03:18:42 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-382a6304efbsm27440350eec.7.2026.11.19.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Thu, 19 Nov 2026 19:18:35 +0800
Message-ID: <179508711555.3615492.10674834361832600268@gmail.com>
In-Reply-To: <20261119062203.GC2300348@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261119062203.GC2300348@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

thanks for the review.  The code changes you asked for are in my tree, and I
would like to check the testing question with you before posting a v3.

The delayed work is now disabled before the interrupt source is masked, so
the handler cannot queue new work after the cancellation, and a work that is
already running cannot re-enable the source behind the mask.  The shared
interrupt is unregistered with devm_free_irq() rather than waited for with
synchronize_irq(): the line stays registered for its other users, and they
can raise it again after synchronize_irq() returns.  The RCAR_THERMAL_MAX_IRQ
comment, the loop variable and the two comments in rcar_thermal_remove() are
as you suggested, and the shutdown flag is gone.

On testing: there is no R-Car hardware here, so what I have is a controlled
ordering test on a KASAN kernel, 17 checks, all passing.  It uses the real
delayed work, workqueue, wait and signal machinery and a simulated interrupt
line shared by two handlers.  It shows that a work queued after
cancel_delayed_work_sync() still runs while the same queue attempt after
disable_delayed_work_sync() is rejected, that a running work undoes a mask
written before the cancellation, and that after synchronize_irq() another
user of the line can invoke our handler again while devm_free_irq() ends
that.

What the test does not do is run rcar_thermal's own ->remove().  It
re-implements the removal ordering, because exercising the driver would need
a real platform device, MMIO and a thermal zone, so the behaviour of the
interrupt status registers on real hardware remains unverified.

I can send the v3 with these changes if that is useful; if you would rather
see a different shape for the removal sequence, I will rework that first.

Thanks,
Yaohan
