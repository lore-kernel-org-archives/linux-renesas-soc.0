Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067C84C227C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978160; cv=pass; b=rX1kTH1bb3aaNgE8+kiX7HMSRhxdYBUkg0x/Eh1RPD7PZ+2B8IC99K10mnT1Iy4UthLfGHhPwDYZsnd5D8Ci0eeF9XwaUsK/K+Oemu1SR2nT43nusucGLG/RXBQ1E+qmOUykfwBPDtMBiOaiy3DoPgq7pRCIkjEhOeEz314dV0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978160; c=relaxed/simple;
	bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGX2VCcy7fvW9yUTOFRAcxwrNKUBvG+xBqK4xC9mmu2xNG04vOvIVcmZQ22Yaz9MB7VagagtG5/zyrIX2dVx5Xyl0OuFD2wVCL+N19DYSNsevxPxIVL6H6VT5bvZkW5Xn/xLurAMkWyNN/SY8eRROoNWaOIFYdq5yNbwR+v3lEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mf97EB9X; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mf97EB9X"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5fb79ce82so21926515ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 04:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978158; cv=none;
        d=google.com; s=arc-20260327;
        b=Xq+oRuGohIwu9rz0wJezMf3hFVT3s7F1vH6kAmuHIN86zZ6+DCHVaO/xWQ6/Q3SrNS
         90hTb4lNSJ5Qfzk/706S1Cg5DrLT45yrDCI2biZOy9n9TL+3BuoDQEMh1fZJFKvrAQyS
         9DwfzRmMJbFlin5+1CmyKqniUwdYnppQ/yZfLJsApLPayVV9hWDv0ME/voVO0LUPh+oM
         cipWbAcNyqKrsIqoeWf6DAKc+tU4VaQgNyqxiHpZWfCos8sDSZ6xOmVwBoKyVJHMZ14f
         yFhi440psS0G6Ro1rR2xNQA5SW6/Y4Xdl8qwkLA3J5bUrIR7R3iJ9KrCY+1foPtIIm+w
         nmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        fh=cq2z03Zf+fxsdoys6GvlzNO8IWI7CZtQfw6h6N28Xog=;
        b=LnNYv02nBuyl6Cftd8qwKziTS99OEPV5Twtk6xdyQqHQvxILDIQmFZGfRebPwGJG5N
         gQZslX8VmqHxeZMKMy93aMwTy585B0SoL4OitoASfiftEE/WsINbJ+H0wlyJbgWrtPAM
         9NVD4r5WQfDitjDoukbFLzxF3yi9QeatsjJai9MemFfN5vGPDUl2i9fbZ3ZSivukH4eZ
         Gcg2/bwC6rkaE7MrKaSZt3WKKrY8dzqbECHAGVygFsbimV3CcvbOPW40v7Eb3y3hJ7RX
         WQHYAdwmzJJbzY+lqZuFuCPkp0KeQKBjYwitAFLepoNNuyL078E7wEArLvSd0NLzMD3M
         AVDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978158; x=1792582958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=mf97EB9XXjAUVxl7uljK4wA8rth/C4fEFPhm1Vb2vVo/cS1SUrKaaMsc//aapgR+Br
         ySXZGuSfxZrgVC8/I0c9uUBzH412QPVKhHOWW+OfyMu8pGR15bXGjiKk8duJ1goLkzGj
         5imewuu03MeJFacvj4/qEZe/5wGZzVQ6WOOEy7LtvZQC9TgPuAacgbrqgGhAygDqCXNI
         EByFzOFd+5ZVHuWua21GJkP/ARMDwh2wAtkLyROFC3gsJYPm+TH2ay5k/TxbKdDHOQ8G
         o0qyKhSFE8DMC+NpQaB80NNhvt8wj+wzAh/M2b1tlKragu2GtuYKNMG/TKMXb1Yci+fG
         eOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978158; x=1792582958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=JaFVF4iutq/sEpdRz/swV/Jaz3R7/VQHESqEegH/FEpZOtZzvM0PlzS8qgFZtHQ6WX
         FJOTKEl+o+aLZ4pgkIJ3Ayw1YNUum5k0IS0rjNnvEWfcowjsbHe+nj01VAVWFHgMRuhg
         oOEvTCkPaFgnV35HY/Hu9W1Yb1c/FJIgs2BMUZG/OCYi+THmEP5tSWc4GoONJkmtxH1G
         wC6Ku91kWYu7mR2V8Y3hxJio3sPWMKmqeJlFQLN/GABh7b/J9OMaMVjFW4ja34fhZEeG
         MiTx0i1DW6uspkSjGzu2KJ2ODXVdKzQi6Hiby8IVIa3wownUOW5ydpLxlWWDnOb/UKAk
         sAxw==
X-Forwarded-Encrypted: i=1; AKwUvByg1LIr0uOKKoapreDi4CCWvmTmXkxo8RXjpvMrrWZjrkYhpZ+iuWDNab5cJcAVdS2XIMyirjQqHYZhNWme54i20A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKRSWf0gB+HYFfzZyxuaJxTjQb98M1J4o03vzTZI0lY6Yc2coCy
	Q7TJ+b4hY+TBe2+wmabkCuPg0q5CZvhebM8VmQXH0sw/VnSYhRLLNPAFWM1MSIkexelyenJVd8f
	EkbdyiLf3VEuWmmn8pt50EY8X7+BTfUU=
X-Gm-Gg: AYBFou28NTrTsxVtXDyQeZiRnoNLIwTeuyScQEBqa0ClFPcpkJRjJ6bECQDykHto5k5
	RMxAB+eTPpFSCvpnUn0itYX+boiL48B42kyyCueQrldFoBMDrOLvhMokRmWeMdVkTKnZKADbbJo
	bwbuZx5alenKVGuH3A07ftLMI1NO/rILhetFTISniHnKgfA+n7NmUlOXq2b3PF99JxUHAqo/Sv9
	ToYbc2F3dgiPLrQSR7PJAsQXlv8a4yS6+YcCzZ2ydpol7R1pHY+E99Zw1ic0sJEk2Cw/5b7YSWp
	M+IHhJrqdUaGEj56Ca60yuCV7LNvSeBMauhrFypItwJE6jjPdmAp1WGdK91ErT09TUov50HCiYZ
	RlKncewUkSU70+nwoXG3+S+n0IS8WoHAaJvruIm5YhZ8jeSWlO4jFtipuoib1ls9koYc=
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2e8427efd9dmr151731365ad.5.1791978158291; Wed, 14 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com> <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
In-Reply-To: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:42:26 +0700
X-Gm-Features: AclHuK--pm1YXW-dAVCk4mePmFKUqLdOhzguEaV2jSOsxf_MJ7HFDWxjeVZGb_U
Message-ID: <CAABR9nHyso5GHpc5Gg-KLF3hJkCHQCYz_mK_i3_0fWDEimLEtw@mail.gmail.com>
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: Chancel Liu <chancel.liu@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Liu,


>
> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
>

Thank you for your review.

Best regards,
Phuc
