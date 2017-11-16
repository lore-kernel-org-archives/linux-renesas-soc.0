Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 0/1] Add R8A77970/Eagle I2C support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <20171116205647.152964720@cogentembedded.com>
Message-ID: <aec5b863-3f0c-1b64-c26c-70b4aa0c5dd8@cogentembedded.com>
Date: Fri, 17 Nov 2017 00:06:16 +0300
MIME-Version: 1.0
In-Reply-To: <20171116205647.152964720@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/16/2017 11:56 PM, Sergei Shtylyov wrote:

> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20171113-v4.14' tag. We're adding the R8A77970 I2C nodes
> and then describing the PCA9654 I/O expander connected to the I2C0 bus.
> These patches depend on the R8A77970/Eagle PFC suport patchset in order
> to apply/compile.
> 
> [1/2] arm64: dts: renesas: r8a77970: add I2C support
> [2/2] arm64: dts: renesas: eagle: add I2C support

    Sorry, my command line got messed up. I'll post the full series now.

WBR, Sergei
