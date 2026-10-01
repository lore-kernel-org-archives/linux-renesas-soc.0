Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B632455615
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840372; cv=none; b=ihJIdkPa2HQnTFajbHROPFRFJOpGRa9BjooM45TuNORf8g+EVA2XtQvjqb9Y9lUS4niRQ1/QaRbGqFn42GR7Mr6FL49UOR5y+NQ4uF4axk4d4kVqep5eEG+JRIYKCNA9VrBQkyp8xr/hPPwaPz5sYknQQ4Hub23eibm2JufBTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840372; c=relaxed/simple;
	bh=prgThMa3RDaqzpouVznTJCw2SnOG3567R/8UJXmM108=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrhr8hH/ksrn0N1q0TE7MLhfNnq7gSqUL6z601JM1yr2tQvrLHnL/5fHBhKhAnfNAa6P/8GA+dQl9N13yiwXcS3g5352CPjsNCupvhGfuFsn384fXYjRaWTtu01mifbABPAVT9tJp8mPpJz1qRjMeE/aK+UeUagcGVfyIhjOqA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUL5M1RL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUL5M1RL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B07B1F00898
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 07:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840371;
	bh=6/ClGyojAdsXGc/BQReGBNWEln4ElamcBkeTBZDQp5g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VUL5M1RLHivOqD3deTq3IHx+IU/NZDzjlfDtnpYRvqmCvxPDLdvQa31bYsRdkSA55
	 Asq2nCy9aApaw2mE8wXMVqvBa1NBfz7vVZSOmy2RMc0SMw+CYtBHnNL4rDDHFJCXpa
	 Az/Cw/B2D0r6WGKCZUeU8wZSkBqsJEIeDlKOD0cRVsN4V+gx53O078XnYEDvtL2mCc
	 NjBHvLAQbj3IQ7aeHD5VIvoq8vPfmmqC38lwdkgcUcdSk3RK0W5EG3Rv6WltGhYbEs
	 S3f+O9X7Imo9yNyxUqF+Gc+N8779hq5ZHFRCdX8Qs/EJqdXpU3xvYzwLJXZCOeZS81
	 2VP919IFoifDw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bb54bd50c2so117219e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 00:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBytYX3VtgXZRP/m/6GS5rHUCpw+UE8aXQKyqI5effPYylur/Na1U6H0RCtp3rA9bzQXOpJTpFoyQbdK+fjNZJjPPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKTeBXFcJJ6qMR0lWU04TQvDc5NRmDkezLhys2PqwU4Gq879xE4
	tNwl1+ncOADhdHTsxBlOPZAM/V7yU9f4RZfk953udRCA9xFVw/M/sxpndmmghZx8gcizopLQzl4
	3gA2heBP/+RGzjAcWge9M02qtM2TvRDZi2Mbmit6BUA==
X-Received: by 2002:a05:6512:2115:b0:5b8:f4ad:6e49 with SMTP id
 2adb3069b0e04-5ba402b86b1mr998420e87.8.1790840013059; Thu, 01 Oct 2026
 00:33:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:33:32 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:33:32 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260930163217.4003d232@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-3-e82f33720737@oss.qualcomm.com> <20260930163217.4003d232@kernel.org>
Date: Thu, 1 Oct 2026 10:33:32 +0300
X-Gmail-Original-Message-ID: <CAMRc=MfEHHny4x8pi-M-WqvcTxFY+98TvRa1jFTKQBjYCzy8FQ@mail.gmail.com>
X-Gm-Features: AclHuK_lOavdmNlSvx0sNUPmny1qPtgCYs4QE7hryCERWbwB8_l7zIoUuzlYZiM
Message-ID: <CAMRc=MfEHHny4x8pi-M-WqvcTxFY+98TvRa1jFTKQBjYCzy8FQ@mail.gmail.com>
Subject: Re: [PATCH net-next v15 3/9] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 01:32:17 +0200, Jakub Kicinski <kuba@kernel.org> said:
> On Wed, 23 Sep 2026 17:14:37 +0200 Bartosz Golaszewski wrote:
>> Implement support for the firmware-managed SGMII/SerDes PHY present on
>> Qualcomm platforms. Do this as a separate driver from the HLOS-managed
>> variant as they don't share almost any code.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/Kconfig                   |  10 +++
>>  drivers/phy/qualcomm/Makefile                  |   1 +
>>  drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 117 +++++++++++++++++++++++++
>>  3 files changed, 128 insertions(+)
>
> Hmm, why is this here? is there a hard dependency?
> Otherwise it'd be better to send it separately out to Vinod,
> this is drivers/phy after all.
>

Heh, it's always the same question of whether to split larger series into
per-subsystem threads or keep them together in order to provide the full
picture and let maintainers pick up subsets of patches. I've been yelled at
for doing both in the past. :)

Ok, I'll split the next iteration into smaller chunks.

Bart
