Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804125;
	b=IrsMvMo7+/0GMKqUasd4RxV94DTFLkPgDOtHateLpG1X6JDoXGmB8cdkfoTDl7+hqPaF
	 fyOkBDmUz+RQX3fzES7PdJBfiT2dzbpXOwrjuYQJInRhXjEuartzmN8OJqkwmgrNzVOy9
	 Ilfe+6NC20cFrAjUHSOnQgmTAALgqCXzHD2vYSu7F/+jfhLyTkXTsGaXdYqFz5sKvsIoF
	 8+BnY/IDBqTLAKhPodol5eFt55jl2ctPlMEtFJ9efgUp/g8IfmbChCxs2P1/1VKy52reu
	 AG/o2CVFpawUwXgfC3Wwq+y0BpH+5xqc1HrYhUVPjYsaOE1haDuLvK7Hg4MsNMV8Z7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804125;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uN9/onAoNgkR+7ro9HSYi/mupzW7YqzE64LyZyUQwBI=;
	b=Lwvjsg/SPjsAwVk0GLPrqAKQmrd8QYzhsAwfkZyFICERXcgm6RkJZexJPtKZVebxCs3i
	 t3KFv/JiakH/wyXieyEIznRDSlHUq1uyVLGNVCKW8Zc89V1eIstIp2zmh4qPr7d1ZJo7J
	 30Cwg0GVmyEk4jxXcTO4REPx4cUaC3T54Yp7ZI70/MgT07iDPPu+OG0/6WItxfSFNpAeu
	 3RDReL/JpkCLydmNOZ4U4lZrhvmDiB1/zZVHCymvdmI3mlQCJtXfy8SSVymmTIgWMDCPL
	 oJXuHeFUmXC1CYCWX3XRWiCn0xi96WJMh1A9DJY8zsMZGfdIiEsqg1cUl2SXfxUyBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="estgrb+/";
	arc=none smtp.remote-ip=95.215.58.200
Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8379606A31F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 18:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8379606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=estgrb+/
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y/VCxMcz7FgjzD7R4U43r7zW7BsA39YNkpkHZku4Dd4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795804122; v=1; x=1796408922;
 b=estgrb+/rj1a9ryeuKpcTocvGJv+r1TIWppwkl2/eYNzSNyDOAeyVCsKQeh1Q8xzN5xLM4qk
 HXUvQ3Bkn3s4zLF55fJfgoDAof797qNhcBDe2zguNwFtokbifLl79Mtx9IW+we3eOAqMPF+55xt
 zfH647SxT71xAFeceaHtxLbw=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 41f83617c506ba49;
	Fri, 27 Nov 2026 18:28:42 +0000
X-Mizu-Trace-ID: 41f83617c506ba49
X-Migadu-Flow: FLOW_OUT
Message-ID: <40e130fb-83fa-4e9f-acf5-114781d76a76@linux.dev>
Date: Fri, 27 Nov 2026 19:28:41 +0100
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: pcs: rzn1-miic: Add resets to rzn1 info
 structure
To: khendry@reliablecontrols.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261127-miic-reset-consumer-v1-0-3cab78b94e23@reliablecontrols.com>
 <20261127-miic-reset-consumer-v1-2-3cab78b94e23@reliablecontrols.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261127-miic-reset-consumer-v1-2-3cab78b94e23@reliablecontrols.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/27/26 19:14, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
> 
> Update the rzn1 info structure to include the resets that the driver needs
> to deassert
> 
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>   drivers/net/pcs/pcs-rzn1-miic.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
> index 682a73cf5a87..3c4eca8960bd 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -128,6 +128,11 @@ static const char * const index_to_string[] = {
>   	"CONV5",
>   };
>   
> +static const char * const rzn1_reset_ids[] = {
> +	"rst_ts",
> +	"rst_miic",
> +};
> +
>   static struct modctrl_match rzt2h_modctrl_match_table[] = {
>   	{0x0, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
>   	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
> @@ -855,6 +860,8 @@ static struct miic_of_data rzn1_miic_of_data = {
>   	.miic_port_start = 1,
>   	.miic_port_last = 5,
>   	.sw_mode_mask = GENMASK(4, 0),
> +	.reset_ids = rzn1_reset_ids,
> +	.reset_count = ARRAY_SIZE(rzn1_reset_ids),
>   	.init_unlock_lock_regs = true,
>   	.miic_write = miic_reg_writel_unlocked,
>   	.type = MIIC_TYPE_RZN1,
> 

Hi Kyle,

LGTM,

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément

