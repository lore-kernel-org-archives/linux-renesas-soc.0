Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, devicetree@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] of: base: add support to get machine model name
Date: Thu, 17 Nov 2016 14:50:13 +0100
Message-ID: <3670336.mMHByOpDl4@wuerfel>
In-Reply-To: <1479383450-19183-1-git-send-email-sudeep.holla@arm.com>
References: <1479383450-19183-1-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday, November 17, 2016 11:50:50 AM CET Sudeep Holla wrote:
> Currently platforms/drivers needing to get the machine model name are
> replicating the same snippet of code. In some case, the OF reference
> counting is either missing or incorrect.
> 
> This patch adds support to read the machine model name either using
> the "model" or the "compatible" property in the device tree root node.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

I like the idea. One small comment:

> +int of_machine_get_model_name(const char **model)
> +{
> +	int error;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return -EINVAL;

The global of_root variable points ot this already, and is defined
in the same file, so I think we can just skip the lookup.

	Arnd
