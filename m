Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add V3H Starter Kit board support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com>
Date: Thu, 10 May 2018 21:07:32 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20180509-v4.17-rc4' tag. I'm adding the device tree support
for the R8A77980-based V3H Starter Kit board; only serial console is supported
for now, NFS support will require more work (it won't use EtherAVB but GEther)
and will be posted later...

[1/2] dt-bindings: arm: document Renesas V3HSK board bindings
[2/2] arm64: dts: renesas: initial V3HSK board device tree

WBR, Sergei
