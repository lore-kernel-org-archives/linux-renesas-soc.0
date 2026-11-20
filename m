Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158129;
	b=MiGzLtKKbaoigcIIAGZsmuy7i0sG47EzW65I1OWbcwafYLeFfhCC52+YSnw+a2oKg+jE
	 awh/zTBAhONH30zA46aJITQC2vqRSpn8FY38+KucZ4gW5k5eOYtcJccu5ent7KromU0IE
	 kb96WgPhJGUBbSV6AVNMbmWO5G6T0npe6vIOgZRPonJQbDf9YU/PL7kvtZDuZBVoKdxWX
	 tyC27mFRWLcvfxEfiYX/jQU7v8h7QWK4C1Yod/xn8wx5IEj00cUGYzpcvqZ0K56lqFD4P
	 p58t+M8OWVpjBON/vYJtQE5cGvPMKtCcWTN1cQtNb/A38sJ9OlxuxKJX96eRXwT76jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158129;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=l1BTs0A8QSXm1yC/tpp+ztP9ZNRIwO6vSe5Y+Ng77GA=;
	b=D7iaNmWtjGi7fGZotX6RPYH2xmYHN0A4OToMZU2+P1fUo5zi6qkLGWegxVgKFGgFnwXZ
	 eNj0GkYBmXSa8umxhCc0rxS0IU7P7O4g0xWGu+jq+MUQ4kl7Vqzk7ePRwmuEQM+BNe4D3
	 GdM9q8QAU7oiy9EK5cImHhUxLLAx5/j3mFWwKK/RyimQv/enKP7uuOiS/Zd/WFTb1c8pn
	 gjCddWxTTPjDIe/DJ6cdMY7Igp6WN3j/43jZwQfki492Gcks2XPObzCliwSlZGEFz+ypO
	 YAcASfGj9z7uEM3SItHbbDA51nkCBneSOc9k3d873I00jUGH4HgKJnM6yY4UBibSljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kIKubPUZ;
	arc=none smtp.remote-ip=91.218.175.179
Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8CD606A32A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 07:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D8CD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kIKubPUZ
X-Envelope-To: linux-renesas-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CDT94LdvtJ/SRa+/vKm1xT8CELiWa31ZDBoilrVpzCM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795158126; v=1; x=1795762926;
 b=kIKubPUZmtDUkASfHRdTytUKWXuPFoaMkh2E7tqaux04bhF9EF65tVQ79yyxfJeWMHRaE+jH
 Bjgym9gec7dqcR244ZLHt7HsF1IG3y41plXaiKyYnMmuIlNGaNkit8rtyqPhUQfTo1mD/KKn2Pl
 p8OJELoTbgq1RBQCZCe0iLsg=
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 574a4a2f70d56532;
	Fri, 20 Nov 2026 07:02:06 +0000
X-Mizu-Trace-ID: 574a4a2f70d56532
X-Migadu-Flow: FLOW_OUT
Message-ID: <4f963eb4-e303-4173-b299-5fbc2685422b@linux.dev>
Date: Fri, 20 Nov 2026 08:02:03 +0100
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
Subject: Re: [PATCH net-next v5 15/24] net: dsa: rzn1-a5psw: Get switch info
 via OF data
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The driver previously assumed a fixed 5-port layout and derived the CPU
> port and number of PCS instances from this. Newer Renesas variants use
> different port counts. Although the CPU port remains the last port, the
> fixed port/PCS topology hard coded in the driver no longer matches all
> hardware.
> 
> Introduce an a5psw_of_data struct holding the per SoC switch info, and
> use this match data in place of the previously embedded constants. This
> makes the port loops, PCS allocation, management-port setup, and other
> topology dependent code reflect the switch layout selected by the
> compatible string.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - No change
> 
> v3->v4:
> - Added return value check for of_device_get_match_data
> 
> v2->v3:
> - Fixed typo in commit message: swicth -> switch
> 
> v1->v2:
> - Updated commit message
> - Renamed A5PSW_MAX_PORTS macro to A5PSW_MAX_NUM_PCS
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 31 ++++++++++++++++++++++---------
>   drivers/net/dsa/rzn1_a5psw.h | 20 +++++++++++++++++---
>   2 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index bccfadc1d5e6..8d7cad90d613 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -384,13 +384,14 @@ static void a5psw_port_bridge_leave(struct dsa_switch *ds, int port,
>   				    struct dsa_bridge bridge)
>   {
>   	struct a5psw *a5psw = ds->priv;
> +	unsigned int cpu_port = a5psw->of_data->cpu_port;
>   
>   	a5psw->bridged_ports &= ~BIT(port);
>   
>   	a5psw_port_set_standalone(a5psw, port, true);
>   
>   	/* No more ports bridged */
> -	if (a5psw->bridged_ports == BIT(A5PSW_CPU_PORT))
> +	if (a5psw->bridged_ports == BIT(cpu_port))
>   		a5psw->br_dev = NULL;
>   }
>   
> @@ -928,20 +929,21 @@ static void a5psw_vlan_setup(struct a5psw *a5psw, int port)
>   static int a5psw_setup(struct dsa_switch *ds)
>   {
>   	struct a5psw *a5psw = ds->priv;
> +	unsigned int cpu_port = a5psw->of_data->cpu_port;
>   	int port, vlan, ret;
>   	struct dsa_port *dp;
>   	u32 reg;
>   
> -	/* Validate that there is only 1 CPU port with index A5PSW_CPU_PORT */
> +	/* Validate that there is only 1 CPU port with index matching cpu_port */
>   	dsa_switch_for_each_cpu_port(dp, ds) {
> -		if (dp->index != A5PSW_CPU_PORT) {
> +		if (dp->index != cpu_port) {
>   			dev_err(a5psw->dev, "Invalid CPU port\n");
>   			return -EINVAL;
>   		}
>   	}
>   
>   	/* Configure management port */
> -	reg = A5PSW_CPU_PORT | A5PSW_MGMT_CFG_ENABLE;
> +	reg = cpu_port | A5PSW_MGMT_CFG_ENABLE;
>   	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
>   
>   	/* Set pattern 0 to forward all frame to mgmt port */
> @@ -1154,7 +1156,7 @@ static void a5psw_pcs_free(struct a5psw *a5psw)
>   {
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(a5psw->pcs); i++) {
> +	for (i = 0; i < a5psw->of_data->npcs; i++) {
>   		if (a5psw->pcs[i])
>   			miic_destroy(a5psw->pcs[i]);
>   	}
> @@ -1181,7 +1183,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
>   			goto free_pcs;
>   		}
>   
> -		if (reg >= ARRAY_SIZE(a5psw->pcs)) {
> +		if (reg >= a5psw->of_data->npcs) {
>   			ret = -ENODEV;
>   			goto free_pcs;
>   		}
> @@ -1228,11 +1230,16 @@ static int a5psw_probe(struct platform_device *pdev)
>   	a5psw->dev = dev;
>   	mutex_init(&a5psw->lk_lock);
>   	spin_lock_init(&a5psw->reg_lock);
> +
> +	a5psw->of_data = of_device_get_match_data(dev);
> +	if (!a5psw->of_data)
> +		return -ENODEV;
> +
>   	a5psw->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(a5psw->base))
>   		return PTR_ERR(a5psw->base);
>   
> -	a5psw->bridged_ports = BIT(A5PSW_CPU_PORT);
> +	a5psw->bridged_ports = BIT(a5psw->of_data->cpu_port);
>   
>   	ret = a5psw_pcs_get(a5psw);
>   	if (ret)
> @@ -1277,7 +1284,7 @@ static int a5psw_probe(struct platform_device *pdev)
>   
>   	ds = &a5psw->ds;
>   	ds->dev = dev;
> -	ds->num_ports = A5PSW_PORTS_NUM;
> +	ds->num_ports = a5psw->of_data->nports;
>   	ds->ops = &a5psw_switch_ops;
>   	ds->phylink_mac_ops = &a5psw_phylink_mac_ops;
>   	ds->priv = a5psw;
> @@ -1319,8 +1326,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, NULL);
>   }
>   
> +static const struct a5psw_of_data rzn1_of_data = {
> +	.nports = 5,
> +	.npcs = 4,
> +	.cpu_port = 4,
> +};
> +
>   static const struct of_device_id a5psw_of_mtable[] = {
> -	{ .compatible = "renesas,rzn1-a5psw", },
> +	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, a5psw_of_mtable);
> diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
> index 9693f8503b0b..26d201931453 100644
> --- a/drivers/net/dsa/rzn1_a5psw.h
> +++ b/drivers/net/dsa/rzn1_a5psw.h
> @@ -195,8 +195,8 @@
>   #define A5PSW_aCarrierSenseErrors		0x924
>   
>   #define A5PSW_VLAN_TAG(prio, id)	(((prio) << 12) | (id))
> -#define A5PSW_PORTS_NUM			5
> -#define A5PSW_CPU_PORT			(A5PSW_PORTS_NUM - 1)
> +/* Maximum number of PCS instances (excludes CPU port) */
> +#define A5PSW_MAX_NUM_PCS			4
>   #define A5PSW_MDIO_DEF_FREQ		2500000
>   #define A5PSW_MDIO_TIMEOUT		100
>   #define A5PSW_JUMBO_LEN			(10 * SZ_1K)
> @@ -231,12 +231,25 @@ union lk_data {
>   	struct fdb_entry entry;
>   };
>   
> +/**
> + * struct a5psw_of_data - OF data structure
> + * @nports: Number of ports in the switch
> + * @npcs: Number of PCS connected to the switch
> + * @cpu_port: CPU port number
> + */
> +struct a5psw_of_data {
> +	unsigned int nports;
> +	unsigned int npcs;
> +	unsigned int cpu_port;
> +};
> +
>   /**
>    * struct a5psw - switch struct
>    * @base: Base address of the switch
>    * @hclk: hclk_switch clock
>    * @clk: clk_switch clock
>    * @dev: Device associated to the switch
> + * @of_data: Pointer to OF data
>    * @mii_bus: MDIO bus struct
>    * @mdio_freq: MDIO bus frequency requested
>    * @pcs: Array of PCS connected to the switch ports (not for the CPU)
> @@ -252,8 +265,9 @@ struct a5psw {
>   	struct clk *hclk;
>   	struct clk *clk;
>   	struct device *dev;
> +	const struct a5psw_of_data *of_data;
>   	struct mii_bus	*mii_bus;
> -	struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
> +	struct phylink_pcs *pcs[A5PSW_MAX_NUM_PCS];
>   	struct dsa_switch ds;
>   	struct mutex lk_lock;
>   	spinlock_t reg_lock;

Hi Prabhakar,

LGTM,

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
