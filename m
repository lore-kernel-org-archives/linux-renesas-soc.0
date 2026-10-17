Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58713AE197
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255171; cv=none; b=lF3w0rRSSdDiOp/dVcdYU82F4hEe9qGNPoUSN4FoGOEVnJDSEkoQU1+aD1QjcTZ3lbFHkyQy6g41Awu9M8R1ZkwsE7xWAFG5DRVvExmHRJ5+GxtJzzHFb3iZSXBQ/o2zai05Xfu56TE/8OqYGoutDsMx/ZG9z2zuLLTArfdS5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255171; c=relaxed/simple;
	bh=VjJXPVvJ28GFo5oaYh5V0N4OmfzYXgOo11M2D9Ou1Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaPlv/662VrPQy/rUP68T3l6M2gm93zs6u6xn5o+FbxxCkVKmmX6/D53aEqn/ibQaXE6EGc4bumJKQG5gg5X4jU74dqOuVoFo79nhPQs6imxr1Hm3BcithiazDeNwnKGk15Is9b6mWjpNwUoHZZCihzzNHs5MvUe4ybRDyK+BXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqcI3njC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaSvvfce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqcI3njC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaSvvfce"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGADiW2033048
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxhbut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35d4538fd74so2936005eec.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255168; x=1792859968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=SaSvvfceXYmvCRkB1Hsft7Hfa2rtKp/OFb5/8k61c6Ny9xnY2K0z1fhXfR2dynAXla
         sEfTL/x8SvDpUrzg7W9c/usmuEzk/4/HkaJ4CI7P7QJNF7Za0qOcb8KK16ChRr7gsaht
         Ezthx3PtrBf9HWTfUfmdOmZz9M2EcylWAiXLPlM0+UHrgR18DdxWIlCnNjFCM+/TryX0
         AV0l2IWcAxGi6WySnx1kzFiZPe/9tll0IeXg1LuynNvxiKrct/K3cckK05P8H1L87hHf
         ZjHNMaNFd3wy6DyipPGH5oGx9pneMBui1E3yL/cCMWmJwdnNUaWU5hJVNrQr1DT3rGPq
         c4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255168; x=1792859968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=FpFDqsYsApmq+1tEUkQjC5SvWiBHHxmOYmVVrX0R4RzEGvfuOwEsNKm76ccxEethn4
         ErCK4muyU0pkXbldghpy18kufcVRvrZh2xkkGrshPZezXvubJ0DBnbgBsEAG8o6l1Xu/
         6ohuJj/jYlyrxgk65uIihjaE8wL4TZw0Fesk2gZ4CbJ8sxZaOggIgSPWlqjF5Rbf1PAt
         3MZlUjBsmnWaYpSUwdZuHUdD26WrGTby/CmudLsGs3F+ImemjF+rq65wqdHgycADxeOi
         1zXJ2eG5hS0hdZj+rtBwQ8clIoQjow3xEkYy9jCz5DX1SPyZmRsH4R6EzfN0zWfABeM8
         OGrg==
X-Forwarded-Encrypted: i=1; AKwUvBxyKCbqslDsOecfnrw0Jyc5/AOP8XL0ugkw3/v+NZGkratoFrochD9A0Ua6bbixigXD1xbKd7dHb8NgEYeVCVgrWA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKVlTS7/fNd3c/qO0dpnBsF9ryf1Raj99qg9IF2VFRNJjwLWQ8i
	T9JQBdPhUZmRWS28Dbh7dlbO7MjYM3GEEVqBL/Pf07OI8+aeY8yfHM7ZxPs6EctUi5okXjhJGqj
	xxnGfNEVIuT4o4WG33glj1HHR2y/FqYvuNAgWGHNMzc1v3c/ilShbR1tvq6LACr1gGdnGWA9bFg
	==
X-Gm-Gg: AYBFou34V52Yn1qNqD2SCXMIr5hImG/u7CrxTxygsX+Us7xGVhKuZYFRdKbNMsQMJoQ
	Ai2Oedg4xSyE+AXmtt1U8AZTODkVkaV0OvunH2Q/j3J1zA3bY0CI0d6Hbnh7LNZqh3gmyOO06QG
	umAhioOCZzsbI5LD1yGbcxf8rsnledA1ZwVQ1op1qX+Zo2ejVVN/cwhaO145FRfK1/EmksznFkn
	36Y/o7eEKA6H3IUCOoDOzvFWnOhe8Yf+c1hOGkWXtd7gsEJurBfJE1lbS0qtfEHlPWZ1r4TCNNA
	1Cx9yjRwbXrgqVETmI9av/hsnvnfEs3il2Au+1Bss3LKxuLQTtuUju2Di8YkF3onnE8SfsuEuCz
	gXZWJP9uI/1+i
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629976eec.32.1792255167442;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXy2RWFSwpdmgG
 ntSmtkPmGh9QhgrQzU0LI3/vrebFy7v0XWBLdPifRHOz/emXVDZPAIE4oCr85l2qhe0VuyEO618
 81va5GpYhkIkkc3zB1XWw71kqiAYoLI=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX/6tBV0Q7m/Yn
 pameBco9gs3YRJm9AvF3OPjj4HdflsHDubvzd/Z1cdZB38G6OKcT3u59ZxlJZEjzYaGV7ioAZob
 MLjNg6qdL1z10f3TWnhkoGQ2ySTCunIfjRtaVByCUczokCcoToiz1b3ck17/mfEFM5xBAiZC0Y/
 NP4SkzR7JCv0rlKczb2+Xc9f1GuALBmelAdmqhRASlxVOr53cRVIaqf5EJc9rb7T/PpXH7VIerP
 pmJL4jwcf6mFPtG3593YcNc2uEqlYFjvfg5dicS4Fp8YKX0cgVCXT+ywGf73i6X/V6GWS3l6OXv
 ZFJK47N3va7HM0IlCMGCtLr5nY02jDpaqiq2DTgQWAVF21OlagqvowpHXRW07okfn2TfAbKR5Wq
 hIi6iKfCYo+7eT3CwZ6tWIj8HXhKZLWsqilN7ayeW9UcAz+fot7RmgYZhNbhVPvCqNVpYRV9lIn
 BJcyjdSYtOHWzAoGwzQ==
X-Proofpoint-ORIG-GUID: _GO_qkskAZBn5_LTvy2MVxyX4swKFyqp
X-Proofpoint-GUID: _GO_qkskAZBn5_LTvy2MVxyX4swKFyqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

