Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297476;
	b=zvI42qRlQmwLcpye+mMV4uZNrM1RBWx3c7zOc8yBNUDVbMib7NHZPC16XrE5Cl1Cgd0K
	 CjS0jrfITObuT8mbHVzxsWnrO8ZkT+Zmbm5fxEp3sdYuBLotIEZVrJzlNH5VHzi6uHySf
	 cnhV0SdJ7Uh8frRrDKLVygv/CZqYTXqY1NojVYfofHrHEEmOVxuSsxb0893NNNvrXVsgL
	 5G4mtithRtXWpfeJDs6lLSE4E2Ans/TBXHZ1X3JxOXWbo30mt/BGPACH7uAmL4JW940Hi
	 Yd1KFJlO0EIKW3vbDJ6xLC/h6pHVb15gn1fw4keT5E0ORB0U0xPiQxP6u02Bj5iZ0aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297476;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
	b=vRX71dePad5Cwb1ClNCt0/7wuWvc6G80Dze++K7qv8/Jz5a+w4ka5RWA3rjFBJakMV9L
	 YKpV9XGj/1o6IUMwwgN3yx3FKCZDbBGHq8EjNIBmdt0VEVmGc1YotsrbBPYCUOvT4bB90
	 qhunIujDqOSCRMW9ypDcDAnmykkC9WtfBDc3J0o44kpIfEHqPKumUzVnQpwrYvU3I61Qo
	 8w8UCcOfrQD3XVbNZLJa227hGkqnZeCRAmHSNZZSMIibH2zaWg0BrAJGXkTWLx9GQbO+W
	 9oDvMoxrWDqb4QI89oVjPEQWUqD+jdjw8IpVdMr+URKnFYORqVpSI4gVQ22TJdedsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFB5606A33D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 07:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFB5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so616485137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 23:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297475; x=1794902275;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bh9PLp3fsMYJMJTRrDf+gKXw1r5bvWitb4XoPWpFjfU=;
        b=c2XTQHj7ZGvCqa4/B1EQgmprpaUAtaGrzMhqGDGdDU3tUSREz+rEYrQ7sf3ArutIc/
         x+qHtck1+ypo6NcMvJgvWAJHrH/hcwnslyiNMEswq53LnxCUzb5z94xcuamYhm6ftGqF
         ClK2kqPyaAU+oE+L3EM2EI/ZXsMIATiR1Uqbs0QZHzrkouSaT9jWpCDo/AnUO0cmCG9I
         CoTL3HtlehDoqwbnZ8Rt4HwbCO0jQ+JxINAd4mkmcHUKeF7ESfkakWEdTWvH++L5nBqY
         ocB5IibIBNg1ZCoglreWF41LYIFVzGpnXqyosvx4SkWmfS30ibBKBfU3iwYpzdKnZKKt
         6qJQ==
X-Forwarded-Encrypted: i=1; AL+hErGVi0DDBXipZgyKHksSQHOMM08IPjCO5GsnUZn3WYzsm90s5LMiO0Ibm6rpCdwKleU5L4Bqs1QJxAOXWUO+Jg6Eew==@vger.kernel.org
X-Gm-Message-State: APuU4Z8c5e50/hqDYgk7aml0Bbme5eouyl/Ytg6GFgeKfCHsOIV6ncRa
	F+mpjFZUIPIHxF4//WQrnV39+WJ0g5tVksliAcN2yPmVgi7NAAWEVz2JBA5mYUzvLSU=
X-Gm-Gg: AYBFou28I/U8/yP2Vanu32SrEChBtrM86BSNA+5vVRvjVAf0MnWsWK9P1hlMzsTmK+s
	DylfqIT0QoHNMZBMuZunE4uqJztMEa5bj6V+99tY0BQ/Bw5MHLvR2DCkfNhyBNLLre5yf4C1tGf
	4shoxuCVhhqe/gKeFNWbkdbz20QcguSaMqhmfPvRuOoheqlEGKWyD/w9+Vw4b3YLuIf9y8X7z4g
	re5Z492CDgKTQFgylI1S+Uqo7tK3URqWxw/OlqqU+FR2xRkslZQVoetUydPYCGrFqwkmWLyVPcd
	qeE/VRt1/SoZroOJ/y3q/QofmSyrAQUp7mivEly0JEvl3VrD35F2mbG0CI3d/V21pC8HyJY+ZhS
	zgp6zT+jGq5RtTGROi2F7FNR5rTEfgAxpa5O3Ij+ya+vG3/dV6vrEnSXR93fg2LhkrYJFYUk5S+
	dtYr2rEC5RfUDlhvBjkl/AZ+7D6eGaXc4qswUK2s4BQw9EG7+QYQT4hpTEmCAa9S7+JrHOEjvYB
	iB0lMjTEqiHwJC3CjA+JOUzXS4ogq4BmUmFlqyoD8INsgQlPxfrh+bGXM/ZGB687g/5sFk7xoKi
	h1LhznQ7/nESvfIUoAcGjOUC8LJrvNmmeiK1wI7ygn8Se4c9DYzNwY2TTsEImfRTiFY=
X-Received: by 2002:a05:6102:1622:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7d301c2dd9amr487345137.30.1794297475268;
        Mon, 09 Nov 2026 23:57:55 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2003b37csm1401833241.6.2026.11.09.23.57.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:57:53 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so616471137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 23:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHA+WSxXezdMs9E8DJhDMXJl3Ha4N5+sW0mAUurqzNC0lODc7bfAYELdsAYYw7d0Zw5HtUtZr+Op1YiKW6l1jR7dw==@vger.kernel.org
X-Received: by 2002:a05:6102:4190:b0:7c3:2b19:6266 with SMTP id
 ada2fe7eead31-7d301bfd9b1mr443049137.22.1794297471476; Mon, 09 Nov 2026
 23:57:51 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
 <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-4-49a08b8daf36@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 08:57:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
X-Gm-Features: AclHuK9JsEgh5r73zJDHAyGi1UgY8FApv7iweIjEvmBZD0LvfpJpCmquM1eWYd8
Message-ID: <CAMuHMdV-2XT7Npksv2om+ZRxOAQJfc92VpLD4sPeoj8AgKUU=w@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: remove redundant pm_runtime_dont_use_autosuspend()
 calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 21:51, Joshua Crofts <crofts@kernel.org> wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
