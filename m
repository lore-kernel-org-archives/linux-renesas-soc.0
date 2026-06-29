Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5018337BA4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741562; cv=none; b=btgQH2IEh/e4B1W/r557jezcHu0hDexo49YRXmBXK3VDeKa4CYpf52rUCNgYDle/mt63ztK6NRc52E0BAagYEQlkjeWnZJsMfCMvCkEPBin4lHAW79EcVSPbx0IXVH6e5J2m+6U5scbi75nsaletkuNoMKtUUyLCHoBtNcN9BjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741562; c=relaxed/simple;
	bh=UvkvBBzeyeMqgudY2G6gDFJg27JiOFKpvozKSRN3iE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuY6AXuKR6su8Kmk5s1hpfa+wWw6xcyGCF9m96GFIaoM0kbUz6cyKW2PIqw8ZdTG0bCzuUAUfQroe01OhXvfF0DrrN/vwVTFENLxXA7w0pdPNcpyC30gEe1hDYXra+WMVMGFvrsgY8uHiFKD9k5aHECpI2OHW2Ezup7SuMlqvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-517de710886so23536031cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741560; x=1783346360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=apPfv7MUcSgovCwIIdR7hQRPfSZ3aKcDdfpYKFIx9fNoot+SViDmpGc/DhQ+l2MvTh
         xLMtXkbMwMeS7SW1KazgFyqavRl0JYEYP9mG8p/3Vo6XAxdtoyoqtsmYo2Vl2PI34OEm
         wYP4fpHip4vukA6l5eDCBFCrstUwNQcZPN6wMLsibNtkpm9PeAxX8vlj6e39KyJG2Q5q
         eyeqnudi81Xu+OEmgGRTBB2q6sexC/jUbt/16WdlbOmTVvYfHPaGGtTkFTs5B8+79xTc
         e1NjVZPSKt9Rp+AMbMXXRCpQUmGkxQjnPfVp2LOrzAhU7GOb1jtfUG1EOtF53dAXnYzT
         CIUg==
X-Forwarded-Encrypted: i=1; AFNElJ/csTm+LOTgwu9DQA/ekmnYnQcOxl74tCyeIt+SWMbvvdvVoOZ/2CfnhD12hG4yIoMBbhBwLoEPb8yfp7T+2TVXKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gspEQ0rFJzmH0iem78qFN/+2NDmaLikwNk7q//qiXoUNLZrj
	SBupnNQe4ZrN2x7sesDuFEWxmucfyg7oKIjyHHg5C6i5qCx1dYXe4+GrNF5Tmw5l
X-Gm-Gg: AfdE7cmcKVT8HLUrqGZ6aicqkru9rW0EqQuN0g+SAnxGX6f1yD9yX+v3s0HJCPlYdBC
	Z/XqTnOyMxuFq7NNn+TkFSknppQLh0M3lMpS4ucf79gU3vtUWoWyBTqhNAAR6IS/cuoikDPMLPi
	kzQUurlgWttnOBNKEq00k75kf7nzWIQDoi6fstH4GVPF8tSBRBXcY7DhyhW/cAw/aUR8nQV6lEe
	knUoZvAPEYeYifYqlAEcGz7rzsARZrXUOAeU25I4GmkDmK46ltb/HMyeIe5bEcIsUxCV6aPwdUE
	2G4wJvT5LxBVLPgbQPsS0n5nMZJTdmeme7NncUimfcTsO5m9snuQt8Cu/hkBZzrr5qm+Fcvw5g4
	3MmfmERhzr2H1DOHHgSZ6vCgCbOg2BLX/cqPwQDhHAFsZazenlBGJrPYZ8E3TbK/0BlxXRg+0Bs
	7IlAINBz+QqwSUUfXorcM73d/3mG+um0kZlhyQ9p2EiqIXm0f+7g==
X-Received: by 2002:a05:622a:110c:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-51c0c96f99emr9337761cf.5.1782741559892;
        Mon, 29 Jun 2026 06:59:19 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f0180d3sm307661286d6.3.2026.06.29.06.59.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:59:19 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f032b47e3cso8244826d6.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 06:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrbhb1w2k/ET7Wf+wXw2XXb6uCBSs58HLtT0fAhwYgQ2NS3ZxVW96QQefa5WRXSj1Fx52Mg1/lUS0r4EgQIEibAFw==@vger.kernel.org
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
