Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] Add Renesas R8A77980 GEther support
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
Date: Fri, 18 May 2018 21:28:29 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 3 patches against DaveM's 'net-next.git' repo. They (gradually)
add R8A77980 GEther support to the 'sh_eth' driver, starting with couple new
register bits/values introduced with this chip, and ending with adding a new
'struct sh_eth_cpu_data' instance connected to the new DT "compatible" prop
value...

[1/1] sh_eth: add RGMII support
[2/3] sh_eth: add EDMR.NBST support
[3/3] sh_eth: add R8A77980 support

MBR, Sergei
